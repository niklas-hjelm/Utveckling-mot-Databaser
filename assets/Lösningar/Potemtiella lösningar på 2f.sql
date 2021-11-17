-- Det största problemet är att tabellen inte är normaliserad.
-- Kolumnen [Location Served] har data formaterad på olika sätt.
-- Ett av problemen med kolumnen är att platserna är separerade på olika sätt och med olika många separatorer.
-- Det andra är att vissa ' ' inte är vanliga space utan andra typr (tex. NO-BREAK-SPACE).
-- Så i denna första lösning så byter jag ut alla sorters space mot vanliga och sedan trimmar för att få samma dormat på alla space
-- Den har också en case/when för att hantera både , och ; som separatorer.< 

SELECT
    CASE
        WHEN CHARINDEX(',', [Location served]) > 0 THEN LTRIM(
            RTRIM(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    REPLACE(
                                        REPLACE(
                                            REPLACE(
                                                REPLACE(
                                                    REPLACE(
                                                        REPLACE(
                                                            REVERSE(
                                                                LEFT(
                                                                    REVERSE([Location served]),
                                                                    CHARINDEX(',', REVERSE([Location served])) -2
                                                                )
                                                            ),
                                                            CHAR(10),
                                                            ' '
                                                        ),
                                                        CHAR(11),
                                                        ' '
                                                    ),
                                                    CHAR(12),
                                                    ' '
                                                ),
                                                CHAR(13),
                                                ' '
                                            ),
                                            CHAR(14),
                                            ' '
                                        ),
                                        CHAR(160),
                                        ' '
                                    ),
                                    CHAR(13) + CHAR(10),
                                    ' '
                                ),
                                CHAR(9),
                                ' '
                            ),
                            ' ',
                            CHAR(17) + CHAR(18)
                        ),
                        CHAR(18) + CHAR(17),
                        ''
                    ),
                    CHAR(17) + CHAR(18),
                    ' '
                )
            )
        )
        WHEN CHARINDEX(';', [Location served]) > 0 THEN LTRIM(
            RTRIM(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    REPLACE(
                                        REPLACE(
                                            REPLACE(
                                                REPLACE(
                                                    REPLACE(
                                                        REPLACE(
                                                            REVERSE(
                                                                LEFT(
                                                                    REVERSE([Location served]),
                                                                    CHARINDEX(';', REVERSE([Location served])) -2
                                                                )
                                                            ),
                                                            CHAR(10),
                                                            ' '
                                                        ),
                                                        CHAR(11),
                                                        ' '
                                                    ),
                                                    CHAR(12),
                                                    ' '
                                                ),
                                                CHAR(13),
                                                ' '
                                            ),
                                            CHAR(14),
                                            ' '
                                        ),
                                        CHAR(160),
                                        ' '
                                    ),
                                    CHAR(13) + CHAR(10),
                                    ' '
                                ),
                                CHAR(9),
                                ' '
                            ),
                            ' ',
                            CHAR(17) + CHAR(18)
                        ),
                        CHAR(18) + CHAR(17),
                        ''
                    ),
                    CHAR(17) + CHAR(18),
                    ' '
                )
            )
        )
        ELSE LTRIM(
            RTRIM(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    REPLACE(
                                        REPLACE(
                                            REPLACE(
                                                REPLACE(
                                                    REPLACE(
                                                        REPLACE([Location served], CHAR(10), ' '),
                                                        CHAR(11),
                                                        ' '
                                                    ),
                                                    CHAR(12),
                                                    ' '
                                                ),
                                                CHAR(13),
                                                ' '
                                            ),
                                            CHAR(14),
                                            ' '
                                        ),
                                        CHAR(160),
                                        ' '
                                    ),
                                    CHAR(13) + CHAR(10),
                                    ' '
                                ),
                                CHAR(9),
                                ' '
                            ),
                            ' ',
                            CHAR(17) + CHAR(18)
                        ),
                        CHAR(18) + CHAR(17),
                        ''
                    ),
                    CHAR(17) + CHAR(18),
                    ' '
                )
            )
        )
    END AS Land,
    COUNT(IATA) AS Antal,
    COUNT(IATA) - COUNT(ICAO) AS AntalNoICAO,
    100 - FLOOR(COUNT(ICAO) * 100.0 / COUNT(IATA)) AS AndelNoICAO
FROM
    Airports
GROUP BY
    CASE
        WHEN CHARINDEX(',', [Location served]) > 0 THEN LTRIM(
            RTRIM(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    REPLACE(
                                        REPLACE(
                                            REPLACE(
                                                REPLACE(
                                                    REPLACE(
                                                        REPLACE(
                                                            REVERSE(
                                                                LEFT(
                                                                    REVERSE([Location served]),
                                                                    CHARINDEX(',', REVERSE([Location served])) -2
                                                                )
                                                            ),
                                                            CHAR(10),
                                                            ' '
                                                        ),
                                                        CHAR(11),
                                                        ' '
                                                    ),
                                                    CHAR(12),
                                                    ' '
                                                ),
                                                CHAR(13),
                                                ' '
                                            ),
                                            CHAR(14),
                                            ' '
                                        ),
                                        CHAR(160),
                                        ' '
                                    ),
                                    CHAR(13) + CHAR(10),
                                    ' '
                                ),
                                CHAR(9),
                                ' '
                            ),
                            ' ',
                            CHAR(17) + CHAR(18)
                        ),
                        CHAR(18) + CHAR(17),
                        ''
                    ),
                    CHAR(17) + CHAR(18),
                    ' '
                )
            )
        )
        WHEN CHARINDEX(';', [Location served]) > 0 THEN LTRIM(
            RTRIM(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    REPLACE(
                                        REPLACE(
                                            REPLACE(
                                                REPLACE(
                                                    REPLACE(
                                                        REPLACE(
                                                            REVERSE(
                                                                LEFT(
                                                                    REVERSE([Location served]),
                                                                    CHARINDEX(';', REVERSE([Location served])) -2
                                                                )
                                                            ),
                                                            CHAR(10),
                                                            ' '
                                                        ),
                                                        CHAR(11),
                                                        ' '
                                                    ),
                                                    CHAR(12),
                                                    ' '
                                                ),
                                                CHAR(13),
                                                ' '
                                            ),
                                            CHAR(14),
                                            ' '
                                        ),
                                        CHAR(160),
                                        ' '
                                    ),
                                    CHAR(13) + CHAR(10),
                                    ' '
                                ),
                                CHAR(9),
                                ' '
                            ),
                            ' ',
                            CHAR(17) + CHAR(18)
                        ),
                        CHAR(18) + CHAR(17),
                        ''
                    ),
                    CHAR(17) + CHAR(18),
                    ' '
                )
            )
        )
        ELSE LTRIM(
            RTRIM(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    REPLACE(
                                        REPLACE(
                                            REPLACE(
                                                REPLACE(
                                                    REPLACE(
                                                        REPLACE([Location served], CHAR(10), ' '),
                                                        CHAR(11),
                                                        ' '
                                                    ),
                                                    CHAR(12),
                                                    ' '
                                                ),
                                                CHAR(13),
                                                ' '
                                            ),
                                            CHAR(14),
                                            ' '
                                        ),
                                        CHAR(160),
                                        ' '
                                    ),
                                    CHAR(13) + CHAR(10),
                                    ' '
                                ),
                                CHAR(9),
                                ' '
                            ),
                            ' ',
                            CHAR(17) + CHAR(18)
                        ),
                        CHAR(18) + CHAR(17),
                        ''
                    ),
                    CHAR(17) + CHAR(18),
                    ' '
                )
            )
        )
    END;