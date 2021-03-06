/*****************************************************************************
 * $Id$
 *
 * Name:     new_tables.sql
 * Project:  RX Cadre Data Visualization
 * Purpose:  Table schema declarations
 * Author:   Kyle Shannon <kyle@pobox.com>
 *
 * This is free and unencumbered software released into the public domain.
 *
 * Anyone is free to copy, modify, publish, use, compile, sell, or
 * distribute this software, either in source code form or as a compiled
 * binary, for any purpose, commercial or non-commercial, and by any
 * means.
 *
 * In jurisdictions that recognize copyright laws, the author or authors
 * of this software dedicate any and all copyright interest in the
 * software to the public domain. We make this dedication for the benefit
 * of the public at large and to the detriment of our heirs and
 * successors. We intend this dedication to be an overt act of
 * relinquishment in perpetuity of all present and future rights to this
 * software under copyright law.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 *
 * For more information, please refer to <http://unlicense.org/>
 *
 ****************************************************************************/

CREATE TABLE plot_location
(
    plot_id TEXT NOT NULL PRIMARY KEY,
    x REAL,
    y REAL,
    geometry TEXT,
    plot_type TEXT
);

CREATE TABLE event
(
    event_name TEXT NOT NULL PRIMARY KEY,
    event_start TEXT NOT NULL,
    event_end TEXT NOT NULL
);

CREATE TABLE obs_table
(
    obs_table_name TEXT NOT NULL,
    table_display_name TEXT,
    timestamp_column TEXT NOT NULL,
    obs_cols TEXT NOT NULL,
    obs_col_names TEXT
);

CREATE TABLE cup_vane_obs
(
    plot_id TEXT NOT NULL,
    timestamp TEXT NOT NULL,
    speed REAL,
    gust REAL,
    direction REAL,
    PRIMARY KEY(plot_id, timestamp)
    FOREIGN KEY(plot_id) REFERENCES plot_location(plot_id)
);

CREATE TABLE fbp_obs
(
    plot_id TEXT NOT NULL,
    timestamp TEXT NOT NULL,
    temperature REAL,
    mt_t REAL,
    mt_r REAL,
    ks_v REAL,
    ks_h REAL,
    nar REAL,
    mt_body REAL,
    bat_volt REAL,
    PRIMARY KEY(plot_id, timestamp),
    FOREIGN KEY(plot_id) REFERENCES plot_location(plot_id)
);

INSERT INTO obs_table VALUES
(
    'cup_vane_obs',
    'Wind Data',
    'timestamp',
    'direction,speed,gust',
    'Direction,Speed,Gust'
);

INSERT INTO obs_table VALUES
(
    'fbp_obs',
    'Fire Behavior Data',
    'timestamp',
    'temperature,mt_t,mt_r,ks_v,ks_h,nar,mt_body,bat_volt',
    'Temperature(C),Medtherm Total, Medtherm Radiant,Pressure Vertical,Pressure Horizontal,Narrow Angle Radiometer,Medtherm Housing Temperature,Battery Voltage'
);

