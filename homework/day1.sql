-- Первый день

use VOROBEVVP;

CREATE  table VOROBEVVP.test(
a UInt8,
b String,
c ENUM('Yes','No') 
)
ENGINE = Log;

SELECT * from VOROBEVVP.test t where b like '%abc%' and a > 10;

INSERT into VOROBEVVP.test 
SELECT * from generateRandom() LIMIT 10000;
