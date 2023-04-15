{
    "metadata": {
        "kernelspec": {
            "name": "SQL",
            "display_name": "SQL",
            "language": "sql"
        },
        "language_info": {
            "name": "sql",
            "version": ""
        }
    },
    "nbformat_minor": 2,
    "nbformat": 4,
    "cells": [
        {
            "cell_type": "markdown",
            "source": [
                "**The total value of merchandise per year and merchandise type**"
            ],
            "metadata": {
                "azdata_cell_guid": "12fe313b-2d37-433d-8101-4dea99505dbe"
            },
            "attachments": {}
        },
        {
            "cell_type": "code",
            "source": [
                "SELECT \r\n",
                "    Top(20)\r\n",
                "    dd.DateYear, \r\n",
                "    md.MerchandiseType, \r\n",
                "    FORMAT(SUM(ef.MerchandiseStocked),'#,#') AS TotalOfflineStock, \r\n",
                "    FORMAT(SUM(osf.MerchandiseStocked),'#,#') AS TotalOnlineStock,\r\n",
                "    FORMAT(SUM(ef.MerchandiseStocked + COALESCE(osf.MerchandiseStocked, 0)),'#,#') AS TotalStock,\r\n",
                "    RANK() OVER(ORDER BY FORMAT(SUM(ef.MerchandiseStocked + COALESCE(osf.MerchandiseStocked, 0)),'#,#')DESC) AS RANK\r\n",
                "FROM EventFact ef\r\n",
                "INNER JOIN DateDim dd ON ef.DateID = dd.DateID\r\n",
                "INNER JOIN MerchandiseDim md ON ef.MerchandiseID = md.MerchandiseID\r\n",
                "FULL OUTER JOIN OnlineSalesFact osf ON ef.DateID = osf.DateID AND ef.MerchandiseID = osf.MerchandiseID\r\n",
                "GROUP BY md.MerchandiseType, dd.DateYear"
            ],
            "metadata": {
                "azdata_cell_guid": "aa36929f-b7b4-4b59-a15c-4a235298a08d",
                "language": "sql"
            },
            "outputs": [
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "Warning: Null value is eliminated by an aggregate or other SET operation."
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(20 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "Total execution time: 00:00:00.060"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "execute_result",
                    "execution_count": 1,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "DateYear"
                                    },
                                    {
                                        "name": "MerchandiseType"
                                    },
                                    {
                                        "name": "TotalOfflineStock"
                                    },
                                    {
                                        "name": "TotalOnlineStock"
                                    },
                                    {
                                        "name": "TotalStock"
                                    },
                                    {
                                        "name": "RANK"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "2017",
                                    "1": "clothing",
                                    "2": "91,796",
                                    "3": "7,822",
                                    "4": "99,618",
                                    "5": "1"
                                },
                                {
                                    "0": "2017",
                                    "1": "accessories",
                                    "2": "92,101",
                                    "3": "5,153",
                                    "4": "97,254",
                                    "5": "2"
                                },
                                {
                                    "0": "2017",
                                    "1": "statues",
                                    "2": "83,450",
                                    "3": "13,504",
                                    "4": "96,954",
                                    "5": "3"
                                },
                                {
                                    "0": "2019",
                                    "1": "statues",
                                    "2": "87,475",
                                    "3": "5,851",
                                    "4": "93,326",
                                    "5": "4"
                                },
                                {
                                    "0": "2017",
                                    "1": "board games",
                                    "2": "75,444",
                                    "3": "17,385",
                                    "4": "92,829",
                                    "5": "5"
                                },
                                {
                                    "0": "2016",
                                    "1": "board games",
                                    "2": "87,275",
                                    "3": "NULL",
                                    "4": "87,275",
                                    "5": "6"
                                },
                                {
                                    "0": "2016",
                                    "1": "figures",
                                    "2": "74,583",
                                    "3": "7,534",
                                    "4": "82,117",
                                    "5": "7"
                                },
                                {
                                    "0": "2016",
                                    "1": "art and book",
                                    "2": "75,416",
                                    "3": "6,456",
                                    "4": "81,872",
                                    "5": "8"
                                },
                                {
                                    "0": "2019",
                                    "1": "accessories",
                                    "2": "75,019",
                                    "3": "6,438",
                                    "4": "81,457",
                                    "5": "9"
                                },
                                {
                                    "0": "2016",
                                    "1": "clothing",
                                    "2": "69,849",
                                    "3": "11,556",
                                    "4": "81,405",
                                    "5": "10"
                                },
                                {
                                    "0": "2016",
                                    "1": "statues",
                                    "2": "70,931",
                                    "3": "9,644",
                                    "4": "80,575",
                                    "5": "11"
                                },
                                {
                                    "0": "2018",
                                    "1": "figures",
                                    "2": "66,177",
                                    "3": "11,059",
                                    "4": "77,236",
                                    "5": "12"
                                },
                                {
                                    "0": "2021",
                                    "1": "pins",
                                    "2": "64,589",
                                    "3": "11,712",
                                    "4": "76,301",
                                    "5": "13"
                                },
                                {
                                    "0": "2016",
                                    "1": "accessories",
                                    "2": "73,091",
                                    "3": "2,514",
                                    "4": "75,605",
                                    "5": "14"
                                },
                                {
                                    "0": "2019",
                                    "1": "art and book",
                                    "2": "62,932",
                                    "3": "5,108",
                                    "4": "68,040",
                                    "5": "15"
                                },
                                {
                                    "0": "2019",
                                    "1": "plush",
                                    "2": "59,105",
                                    "3": "7,980",
                                    "4": "67,085",
                                    "5": "16"
                                },
                                {
                                    "0": "2017",
                                    "1": "figures",
                                    "2": "61,295",
                                    "3": "4,401",
                                    "4": "65,696",
                                    "5": "17"
                                },
                                {
                                    "0": "2018",
                                    "1": "accessories",
                                    "2": "58,798",
                                    "3": "6,843",
                                    "4": "65,641",
                                    "5": "18"
                                },
                                {
                                    "0": "2020",
                                    "1": "pins",
                                    "2": "55,396",
                                    "3": "7,726",
                                    "4": "63,122",
                                    "5": "19"
                                },
                                {
                                    "0": "2019",
                                    "1": "figures",
                                    "2": "51,139",
                                    "3": "5,437",
                                    "4": "56,576",
                                    "5": "20"
                                }
                            ]
                        },
                        "text/html": "<table><tr><th>DateYear</th><th>MerchandiseType</th><th>TotalOfflineStock</th><th>TotalOnlineStock</th><th>TotalStock</th><th>RANK</th></tr><tr><td>2017</td><td>clothing</td><td>91,796</td><td>7,822</td><td>99,618</td><td>1</td></tr><tr><td>2017</td><td>accessories</td><td>92,101</td><td>5,153</td><td>97,254</td><td>2</td></tr><tr><td>2017</td><td>statues</td><td>83,450</td><td>13,504</td><td>96,954</td><td>3</td></tr><tr><td>2019</td><td>statues</td><td>87,475</td><td>5,851</td><td>93,326</td><td>4</td></tr><tr><td>2017</td><td>board games</td><td>75,444</td><td>17,385</td><td>92,829</td><td>5</td></tr><tr><td>2016</td><td>board games</td><td>87,275</td><td>NULL</td><td>87,275</td><td>6</td></tr><tr><td>2016</td><td>figures</td><td>74,583</td><td>7,534</td><td>82,117</td><td>7</td></tr><tr><td>2016</td><td>art and book</td><td>75,416</td><td>6,456</td><td>81,872</td><td>8</td></tr><tr><td>2019</td><td>accessories</td><td>75,019</td><td>6,438</td><td>81,457</td><td>9</td></tr><tr><td>2016</td><td>clothing</td><td>69,849</td><td>11,556</td><td>81,405</td><td>10</td></tr><tr><td>2016</td><td>statues</td><td>70,931</td><td>9,644</td><td>80,575</td><td>11</td></tr><tr><td>2018</td><td>figures</td><td>66,177</td><td>11,059</td><td>77,236</td><td>12</td></tr><tr><td>2021</td><td>pins</td><td>64,589</td><td>11,712</td><td>76,301</td><td>13</td></tr><tr><td>2016</td><td>accessories</td><td>73,091</td><td>2,514</td><td>75,605</td><td>14</td></tr><tr><td>2019</td><td>art and book</td><td>62,932</td><td>5,108</td><td>68,040</td><td>15</td></tr><tr><td>2019</td><td>plush</td><td>59,105</td><td>7,980</td><td>67,085</td><td>16</td></tr><tr><td>2017</td><td>figures</td><td>61,295</td><td>4,401</td><td>65,696</td><td>17</td></tr><tr><td>2018</td><td>accessories</td><td>58,798</td><td>6,843</td><td>65,641</td><td>18</td></tr><tr><td>2020</td><td>pins</td><td>55,396</td><td>7,726</td><td>63,122</td><td>19</td></tr><tr><td>2019</td><td>figures</td><td>51,139</td><td>5,437</td><td>56,576</td><td>20</td></tr></table>"
                    },
                    "metadata": {}
                }
            ],
            "execution_count": 1
        },
        {
            "cell_type": "markdown",
            "source": [
                "**Evaluation of profits generated through promotions**"
            ],
            "metadata": {
                "azdata_cell_guid": "584dc2ba-f11b-47ea-98d5-28a45c6a6235"
            },
            "attachments": {}
        },
        {
            "cell_type": "code",
            "source": [
                "SELECT\r\n",
                "    CASE \r\n",
                "        WHEN GROUPING(DateYear) = 0 AND GROUPING(PromotionType) = 1 THEN CONCAT('Total value for ', DateYear)\r\n",
                "        WHEN GROUPING(DateYear) = 1 AND GROUPING(PromotionType) = 1 THEN 'Grand Total'\r\n",
                "        ELSE CAST(DateYear AS VARCHAR) \r\n",
                "    END AS Year,\r\n",
                "    CASE \r\n",
                "        WHEN GROUPING(PromotionType) = 0 THEN PromotionType\r\n",
                "        ELSE 'All Promotion Type'\r\n",
                "    END AS PromotionType,\r\n",
                "    FORMAT(SUM(PromotionCost), 'C', 'en-GB') [Total Promotion Cost], \r\n",
                "    FORMAT(SUM(PromotionRevenue), 'C', 'en-GB') [Gross Revenue], \r\n",
                "    FORMAT(SUM((PromotionRevenue) - (PromotionCost)),'C', 'en-GB') [Gross Profit] \r\n",
                "FROM \r\n",
                "    EventFact \r\n",
                "    INNER JOIN DateDim ON EventFact.DateID = DateDim.DateID \r\n",
                "    INNER JOIN PromotionDim ON EventFact.PromotionID = PromotionDim.PromotionID \r\n",
                "GROUP BY \r\n",
                "    GROUPING SETS((DateYear, PromotionType), (DateYear), ())\r\n",
                "ORDER BY \r\n",
                "    DateYear, PromotionType;"
            ],
            "metadata": {
                "azdata_cell_guid": "66698286-0740-416f-b341-f1e1520c8949",
                "language": "sql"
            },
            "outputs": [
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(43 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "Total execution time: 00:00:00.057"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "execute_result",
                    "execution_count": 2,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "Year"
                                    },
                                    {
                                        "name": "PromotionType"
                                    },
                                    {
                                        "name": "Total Promotion Cost"
                                    },
                                    {
                                        "name": "Gross Revenue"
                                    },
                                    {
                                        "name": "Gross Profit"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "Grand Total",
                                    "1": "All Promotion Type",
                                    "2": "£5,586,071.00",
                                    "3": "£22,691,112.00",
                                    "4": "£17,105,041.00"
                                },
                                {
                                    "0": "Total value for 2016",
                                    "1": "All Promotion Type",
                                    "2": "£1,143,579.00",
                                    "3": "£4,383,232.00",
                                    "4": "£3,239,653.00"
                                },
                                {
                                    "0": "2016",
                                    "1": "Digital Promotions",
                                    "2": "£201,778.00",
                                    "3": "£779,441.00",
                                    "4": "£577,663.00"
                                },
                                {
                                    "0": "2016",
                                    "1": "Direct Marketing",
                                    "2": "£253,411.00",
                                    "3": "£898,978.00",
                                    "4": "£645,567.00"
                                },
                                {
                                    "0": "2016",
                                    "1": "General Advertising",
                                    "2": "£152,265.00",
                                    "3": "£448,856.00",
                                    "4": "£296,591.00"
                                },
                                {
                                    "0": "2016",
                                    "1": "Public Relations",
                                    "2": "£276,967.00",
                                    "3": "£1,095,556.00",
                                    "4": "£818,589.00"
                                },
                                {
                                    "0": "2016",
                                    "1": "Sales Promotion",
                                    "2": "£123,504.00",
                                    "3": "£424,197.00",
                                    "4": "£300,693.00"
                                },
                                {
                                    "0": "2016",
                                    "1": "Sponsorships",
                                    "2": "£135,654.00",
                                    "3": "£736,204.00",
                                    "4": "£600,550.00"
                                },
                                {
                                    "0": "Total value for 2017",
                                    "1": "All Promotion Type",
                                    "2": "£1,078,781.00",
                                    "3": "£4,291,610.00",
                                    "4": "£3,212,829.00"
                                },
                                {
                                    "0": "2017",
                                    "1": "Digital Promotions",
                                    "2": "£116,368.00",
                                    "3": "£538,985.00",
                                    "4": "£422,617.00"
                                },
                                {
                                    "0": "2017",
                                    "1": "Direct Marketing",
                                    "2": "£220,569.00",
                                    "3": "£777,952.00",
                                    "4": "£557,383.00"
                                },
                                {
                                    "0": "2017",
                                    "1": "General Advertising",
                                    "2": "£126,590.00",
                                    "3": "£598,424.00",
                                    "4": "£471,834.00"
                                },
                                {
                                    "0": "2017",
                                    "1": "Public Relations",
                                    "2": "£274,506.00",
                                    "3": "£1,097,935.00",
                                    "4": "£823,429.00"
                                },
                                {
                                    "0": "2017",
                                    "1": "Sales Promotion",
                                    "2": "£202,599.00",
                                    "3": "£864,439.00",
                                    "4": "£661,840.00"
                                },
                                {
                                    "0": "2017",
                                    "1": "Sponsorships",
                                    "2": "£138,149.00",
                                    "3": "£413,875.00",
                                    "4": "£275,726.00"
                                },
                                {
                                    "0": "Total value for 2018",
                                    "1": "All Promotion Type",
                                    "2": "£1,154,914.00",
                                    "3": "£4,639,386.00",
                                    "4": "£3,484,472.00"
                                },
                                {
                                    "0": "2018",
                                    "1": "Digital Promotions",
                                    "2": "£226,916.00",
                                    "3": "£896,189.00",
                                    "4": "£669,273.00"
                                },
                                {
                                    "0": "2018",
                                    "1": "Direct Marketing",
                                    "2": "£219,596.00",
                                    "3": "£897,842.00",
                                    "4": "£678,246.00"
                                },
                                {
                                    "0": "2018",
                                    "1": "General Advertising",
                                    "2": "£177,492.00",
                                    "3": "£741,915.00",
                                    "4": "£564,423.00"
                                },
                                {
                                    "0": "2018",
                                    "1": "Public Relations",
                                    "2": "£225,219.00",
                                    "3": "£996,903.00",
                                    "4": "£771,684.00"
                                },
                                {
                                    "0": "2018",
                                    "1": "Sales Promotion",
                                    "2": "£165,599.00",
                                    "3": "£550,671.00",
                                    "4": "£385,072.00"
                                },
                                {
                                    "0": "2018",
                                    "1": "Sponsorships",
                                    "2": "£140,092.00",
                                    "3": "£555,866.00",
                                    "4": "£415,774.00"
                                },
                                {
                                    "0": "Total value for 2019",
                                    "1": "All Promotion Type",
                                    "2": "£1,097,144.00",
                                    "3": "£4,581,721.00",
                                    "4": "£3,484,577.00"
                                },
                                {
                                    "0": "2019",
                                    "1": "Digital Promotions",
                                    "2": "£169,708.00",
                                    "3": "£729,049.00",
                                    "4": "£559,341.00"
                                },
                                {
                                    "0": "2019",
                                    "1": "Direct Marketing",
                                    "2": "£258,824.00",
                                    "3": "£935,283.00",
                                    "4": "£676,459.00"
                                },
                                {
                                    "0": "2019",
                                    "1": "General Advertising",
                                    "2": "£121,155.00",
                                    "3": "£611,199.00",
                                    "4": "£490,044.00"
                                },
                                {
                                    "0": "2019",
                                    "1": "Public Relations",
                                    "2": "£210,701.00",
                                    "3": "£933,836.00",
                                    "4": "£723,135.00"
                                },
                                {
                                    "0": "2019",
                                    "1": "Sales Promotion",
                                    "2": "£154,921.00",
                                    "3": "£600,665.00",
                                    "4": "£445,744.00"
                                },
                                {
                                    "0": "2019",
                                    "1": "Sponsorships",
                                    "2": "£181,835.00",
                                    "3": "£771,689.00",
                                    "4": "£589,854.00"
                                },
                                {
                                    "0": "Total value for 2020",
                                    "1": "All Promotion Type",
                                    "2": "£537,472.00",
                                    "3": "£2,442,064.00",
                                    "4": "£1,904,592.00"
                                },
                                {
                                    "0": "2020",
                                    "1": "Digital Promotions",
                                    "2": "£50,745.00",
                                    "3": "£243,821.00",
                                    "4": "£193,076.00"
                                },
                                {
                                    "0": "2020",
                                    "1": "Direct Marketing",
                                    "2": "£118,423.00",
                                    "3": "£486,465.00",
                                    "4": "£368,042.00"
                                },
                                {
                                    "0": "2020",
                                    "1": "General Advertising",
                                    "2": "£66,376.00",
                                    "3": "£420,853.00",
                                    "4": "£354,477.00"
                                },
                                {
                                    "0": "2020",
                                    "1": "Public Relations",
                                    "2": "£96,135.00",
                                    "3": "£386,728.00",
                                    "4": "£290,593.00"
                                },
                                {
                                    "0": "2020",
                                    "1": "Sales Promotion",
                                    "2": "£113,901.00",
                                    "3": "£505,832.00",
                                    "4": "£391,931.00"
                                },
                                {
                                    "0": "2020",
                                    "1": "Sponsorships",
                                    "2": "£91,892.00",
                                    "3": "£398,365.00",
                                    "4": "£306,473.00"
                                },
                                {
                                    "0": "Total value for 2021",
                                    "1": "All Promotion Type",
                                    "2": "£574,181.00",
                                    "3": "£2,353,099.00",
                                    "4": "£1,778,918.00"
                                },
                                {
                                    "0": "2021",
                                    "1": "Digital Promotions",
                                    "2": "£100,028.00",
                                    "3": "£327,522.00",
                                    "4": "£227,494.00"
                                },
                                {
                                    "0": "2021",
                                    "1": "Direct Marketing",
                                    "2": "£114,436.00",
                                    "3": "£468,006.00",
                                    "4": "£353,570.00"
                                },
                                {
                                    "0": "2021",
                                    "1": "General Advertising",
                                    "2": "£78,890.00",
                                    "3": "£305,015.00",
                                    "4": "£226,125.00"
                                },
                                {
                                    "0": "2021",
                                    "1": "Public Relations",
                                    "2": "£100,372.00",
                                    "3": "£498,770.00",
                                    "4": "£398,398.00"
                                },
                                {
                                    "0": "2021",
                                    "1": "Sales Promotion",
                                    "2": "£90,360.00",
                                    "3": "£353,690.00",
                                    "4": "£263,330.00"
                                },
                                {
                                    "0": "2021",
                                    "1": "Sponsorships",
                                    "2": "£90,095.00",
                                    "3": "£400,096.00",
                                    "4": "£310,001.00"
                                }
                            ]
                        },
                        "text/html": "<table><tr><th>Year</th><th>PromotionType</th><th>Total Promotion Cost</th><th>Gross Revenue</th><th>Gross Profit</th></tr><tr><td>Grand Total</td><td>All Promotion Type</td><td>£5,586,071.00</td><td>£22,691,112.00</td><td>£17,105,041.00</td></tr><tr><td>Total value for 2016</td><td>All Promotion Type</td><td>£1,143,579.00</td><td>£4,383,232.00</td><td>£3,239,653.00</td></tr><tr><td>2016</td><td>Digital Promotions</td><td>£201,778.00</td><td>£779,441.00</td><td>£577,663.00</td></tr><tr><td>2016</td><td>Direct Marketing</td><td>£253,411.00</td><td>£898,978.00</td><td>£645,567.00</td></tr><tr><td>2016</td><td>General Advertising</td><td>£152,265.00</td><td>£448,856.00</td><td>£296,591.00</td></tr><tr><td>2016</td><td>Public Relations</td><td>£276,967.00</td><td>£1,095,556.00</td><td>£818,589.00</td></tr><tr><td>2016</td><td>Sales Promotion</td><td>£123,504.00</td><td>£424,197.00</td><td>£300,693.00</td></tr><tr><td>2016</td><td>Sponsorships</td><td>£135,654.00</td><td>£736,204.00</td><td>£600,550.00</td></tr><tr><td>Total value for 2017</td><td>All Promotion Type</td><td>£1,078,781.00</td><td>£4,291,610.00</td><td>£3,212,829.00</td></tr><tr><td>2017</td><td>Digital Promotions</td><td>£116,368.00</td><td>£538,985.00</td><td>£422,617.00</td></tr><tr><td>2017</td><td>Direct Marketing</td><td>£220,569.00</td><td>£777,952.00</td><td>£557,383.00</td></tr><tr><td>2017</td><td>General Advertising</td><td>£126,590.00</td><td>£598,424.00</td><td>£471,834.00</td></tr><tr><td>2017</td><td>Public Relations</td><td>£274,506.00</td><td>£1,097,935.00</td><td>£823,429.00</td></tr><tr><td>2017</td><td>Sales Promotion</td><td>£202,599.00</td><td>£864,439.00</td><td>£661,840.00</td></tr><tr><td>2017</td><td>Sponsorships</td><td>£138,149.00</td><td>£413,875.00</td><td>£275,726.00</td></tr><tr><td>Total value for 2018</td><td>All Promotion Type</td><td>£1,154,914.00</td><td>£4,639,386.00</td><td>£3,484,472.00</td></tr><tr><td>2018</td><td>Digital Promotions</td><td>£226,916.00</td><td>£896,189.00</td><td>£669,273.00</td></tr><tr><td>2018</td><td>Direct Marketing</td><td>£219,596.00</td><td>£897,842.00</td><td>£678,246.00</td></tr><tr><td>2018</td><td>General Advertising</td><td>£177,492.00</td><td>£741,915.00</td><td>£564,423.00</td></tr><tr><td>2018</td><td>Public Relations</td><td>£225,219.00</td><td>£996,903.00</td><td>£771,684.00</td></tr><tr><td>2018</td><td>Sales Promotion</td><td>£165,599.00</td><td>£550,671.00</td><td>£385,072.00</td></tr><tr><td>2018</td><td>Sponsorships</td><td>£140,092.00</td><td>£555,866.00</td><td>£415,774.00</td></tr><tr><td>Total value for 2019</td><td>All Promotion Type</td><td>£1,097,144.00</td><td>£4,581,721.00</td><td>£3,484,577.00</td></tr><tr><td>2019</td><td>Digital Promotions</td><td>£169,708.00</td><td>£729,049.00</td><td>£559,341.00</td></tr><tr><td>2019</td><td>Direct Marketing</td><td>£258,824.00</td><td>£935,283.00</td><td>£676,459.00</td></tr><tr><td>2019</td><td>General Advertising</td><td>£121,155.00</td><td>£611,199.00</td><td>£490,044.00</td></tr><tr><td>2019</td><td>Public Relations</td><td>£210,701.00</td><td>£933,836.00</td><td>£723,135.00</td></tr><tr><td>2019</td><td>Sales Promotion</td><td>£154,921.00</td><td>£600,665.00</td><td>£445,744.00</td></tr><tr><td>2019</td><td>Sponsorships</td><td>£181,835.00</td><td>£771,689.00</td><td>£589,854.00</td></tr><tr><td>Total value for 2020</td><td>All Promotion Type</td><td>£537,472.00</td><td>£2,442,064.00</td><td>£1,904,592.00</td></tr><tr><td>2020</td><td>Digital Promotions</td><td>£50,745.00</td><td>£243,821.00</td><td>£193,076.00</td></tr><tr><td>2020</td><td>Direct Marketing</td><td>£118,423.00</td><td>£486,465.00</td><td>£368,042.00</td></tr><tr><td>2020</td><td>General Advertising</td><td>£66,376.00</td><td>£420,853.00</td><td>£354,477.00</td></tr><tr><td>2020</td><td>Public Relations</td><td>£96,135.00</td><td>£386,728.00</td><td>£290,593.00</td></tr><tr><td>2020</td><td>Sales Promotion</td><td>£113,901.00</td><td>£505,832.00</td><td>£391,931.00</td></tr><tr><td>2020</td><td>Sponsorships</td><td>£91,892.00</td><td>£398,365.00</td><td>£306,473.00</td></tr><tr><td>Total value for 2021</td><td>All Promotion Type</td><td>£574,181.00</td><td>£2,353,099.00</td><td>£1,778,918.00</td></tr><tr><td>2021</td><td>Digital Promotions</td><td>£100,028.00</td><td>£327,522.00</td><td>£227,494.00</td></tr><tr><td>2021</td><td>Direct Marketing</td><td>£114,436.00</td><td>£468,006.00</td><td>£353,570.00</td></tr><tr><td>2021</td><td>General Advertising</td><td>£78,890.00</td><td>£305,015.00</td><td>£226,125.00</td></tr><tr><td>2021</td><td>Public Relations</td><td>£100,372.00</td><td>£498,770.00</td><td>£398,398.00</td></tr><tr><td>2021</td><td>Sales Promotion</td><td>£90,360.00</td><td>£353,690.00</td><td>£263,330.00</td></tr><tr><td>2021</td><td>Sponsorships</td><td>£90,095.00</td><td>£400,096.00</td><td>£310,001.00</td></tr></table>"
                    },
                    "metadata": {}
                }
            ],
            "execution_count": 2
        },
        {
            "cell_type": "markdown",
            "source": [
                "**Revenue drain accrued due to refunds**"
            ],
            "metadata": {
                "azdata_cell_guid": "8e04390a-fde7-406c-9a89-6c01f205e3d8"
            },
            "attachments": {}
        },
        {
            "cell_type": "code",
            "source": [
                "SELECT\r\n",
                "dd.DateYear,\r\n",
                "CASE \r\n",
                "    WHEN GROUPING(td.TicketEvent) = 0 THEN td.TicketEvent\r\n",
                "    ELSE 'All Events Value Per Year'\r\n",
                "END AS TicketEvent,\r\n",
                "FORMAT(SUM(rf.TicketsRefundedPND),'C','en-GB') AS TotalTicketRefunds,\r\n",
                "FORMAT(SUM(rf.MerchandiseRefundedPND+rf.OnlineMerchantiseRefundedPND),'C','en-GB') AS TotalMerchandiseRefunds,\r\n",
                "FORMAT(SUM(rf.MerchandiseRefundedPND+rf.OnlineMerchantiseRefundedPND+rf.TicketsRefundedPND),'C','en-GB') \r\n",
                "AS TotalRefundsValue\r\n",
                "FROM RefundFact rf\r\n",
                "INNER JOIN TicketDim td ON rf.TicketID = td.TicketID\r\n",
                "INNER JOIN DateDim dd ON rf.DateID = dd.DateID\r\n",
                "GROUP BY dd.DateYear, ROLLUP(td.TicketEvent)"
            ],
            "metadata": {
                "azdata_cell_guid": "373e0ad5-1bb6-4c31-9314-73c2c89ba661",
                "language": "sql"
            },
            "outputs": [
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(36 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "Total execution time: 00:00:00.059"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "execute_result",
                    "execution_count": 3,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "DateYear"
                                    },
                                    {
                                        "name": "TicketEvent"
                                    },
                                    {
                                        "name": "TotalTicketRefunds"
                                    },
                                    {
                                        "name": "TotalMerchandiseRefunds"
                                    },
                                    {
                                        "name": "TotalRefundsValue"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "2016",
                                    "1": "Finals",
                                    "2": "£103,478.00",
                                    "3": "£278,806.00",
                                    "4": "£382,284.00"
                                },
                                {
                                    "0": "2016",
                                    "1": "Play-in",
                                    "2": "£84,207.00",
                                    "3": "£264,900.00",
                                    "4": "£349,107.00"
                                },
                                {
                                    "0": "2016",
                                    "1": "Quarterfinal",
                                    "2": "£90,096.00",
                                    "3": "£231,044.00",
                                    "4": "£321,140.00"
                                },
                                {
                                    "0": "2016",
                                    "1": "Semifinal",
                                    "2": "£79,922.00",
                                    "3": "£218,995.00",
                                    "4": "£298,917.00"
                                },
                                {
                                    "0": "2016",
                                    "1": "Weekday",
                                    "2": "£89,646.00",
                                    "3": "£258,560.00",
                                    "4": "£348,206.00"
                                },
                                {
                                    "0": "2016",
                                    "1": "All Events Value Per Year",
                                    "2": "£447,349.00",
                                    "3": "£1,252,305.00",
                                    "4": "£1,699,654.00"
                                },
                                {
                                    "0": "2017",
                                    "1": "Finals",
                                    "2": "£102,815.00",
                                    "3": "£265,185.00",
                                    "4": "£368,000.00"
                                },
                                {
                                    "0": "2017",
                                    "1": "Play-in",
                                    "2": "£102,746.00",
                                    "3": "£270,410.00",
                                    "4": "£373,156.00"
                                },
                                {
                                    "0": "2017",
                                    "1": "Quarterfinal",
                                    "2": "£78,652.00",
                                    "3": "£255,544.00",
                                    "4": "£334,196.00"
                                },
                                {
                                    "0": "2017",
                                    "1": "Semifinal",
                                    "2": "£74,954.00",
                                    "3": "£181,706.00",
                                    "4": "£256,660.00"
                                },
                                {
                                    "0": "2017",
                                    "1": "Weekday",
                                    "2": "£81,850.00",
                                    "3": "£201,788.00",
                                    "4": "£283,638.00"
                                },
                                {
                                    "0": "2017",
                                    "1": "All Events Value Per Year",
                                    "2": "£441,017.00",
                                    "3": "£1,174,633.00",
                                    "4": "£1,615,650.00"
                                },
                                {
                                    "0": "2018",
                                    "1": "Finals",
                                    "2": "£108,633.00",
                                    "3": "£267,071.00",
                                    "4": "£375,704.00"
                                },
                                {
                                    "0": "2018",
                                    "1": "Play-in",
                                    "2": "£84,491.00",
                                    "3": "£232,233.00",
                                    "4": "£316,724.00"
                                },
                                {
                                    "0": "2018",
                                    "1": "Quarterfinal",
                                    "2": "£92,375.00",
                                    "3": "£244,819.00",
                                    "4": "£337,194.00"
                                },
                                {
                                    "0": "2018",
                                    "1": "Semifinal",
                                    "2": "£81,524.00",
                                    "3": "£235,683.00",
                                    "4": "£317,207.00"
                                },
                                {
                                    "0": "2018",
                                    "1": "Weekday",
                                    "2": "£106,156.00",
                                    "3": "£265,888.00",
                                    "4": "£372,044.00"
                                },
                                {
                                    "0": "2018",
                                    "1": "All Events Value Per Year",
                                    "2": "£473,179.00",
                                    "3": "£1,245,694.00",
                                    "4": "£1,718,873.00"
                                },
                                {
                                    "0": "2019",
                                    "1": "Finals",
                                    "2": "£113,595.00",
                                    "3": "£319,426.00",
                                    "4": "£433,021.00"
                                },
                                {
                                    "0": "2019",
                                    "1": "Play-in",
                                    "2": "£79,913.00",
                                    "3": "£234,531.00",
                                    "4": "£314,444.00"
                                },
                                {
                                    "0": "2019",
                                    "1": "Quarterfinal",
                                    "2": "£74,244.00",
                                    "3": "£184,332.00",
                                    "4": "£258,576.00"
                                },
                                {
                                    "0": "2019",
                                    "1": "Semifinal",
                                    "2": "£78,502.00",
                                    "3": "£218,641.00",
                                    "4": "£297,143.00"
                                },
                                {
                                    "0": "2019",
                                    "1": "Weekday",
                                    "2": "£104,780.00",
                                    "3": "£294,918.00",
                                    "4": "£399,698.00"
                                },
                                {
                                    "0": "2019",
                                    "1": "All Events Value Per Year",
                                    "2": "£451,034.00",
                                    "3": "£1,251,848.00",
                                    "4": "£1,702,882.00"
                                },
                                {
                                    "0": "2020",
                                    "1": "Finals",
                                    "2": "£42,495.00",
                                    "3": "£99,102.00",
                                    "4": "£141,597.00"
                                },
                                {
                                    "0": "2020",
                                    "1": "Play-in",
                                    "2": "£36,738.00",
                                    "3": "£105,091.00",
                                    "4": "£141,829.00"
                                },
                                {
                                    "0": "2020",
                                    "1": "Quarterfinal",
                                    "2": "£63,929.00",
                                    "3": "£154,055.00",
                                    "4": "£217,984.00"
                                },
                                {
                                    "0": "2020",
                                    "1": "Semifinal",
                                    "2": "£48,574.00",
                                    "3": "£130,389.00",
                                    "4": "£178,963.00"
                                },
                                {
                                    "0": "2020",
                                    "1": "Weekday",
                                    "2": "£30,373.00",
                                    "3": "£103,788.00",
                                    "4": "£134,161.00"
                                },
                                {
                                    "0": "2020",
                                    "1": "All Events Value Per Year",
                                    "2": "£222,109.00",
                                    "3": "£592,425.00",
                                    "4": "£814,534.00"
                                },
                                {
                                    "0": "2021",
                                    "1": "Finals",
                                    "2": "£56,239.00",
                                    "3": "£157,265.00",
                                    "4": "£213,504.00"
                                },
                                {
                                    "0": "2021",
                                    "1": "Play-in",
                                    "2": "£50,222.00",
                                    "3": "£162,193.00",
                                    "4": "£212,415.00"
                                },
                                {
                                    "0": "2021",
                                    "1": "Quarterfinal",
                                    "2": "£36,039.00",
                                    "3": "£94,977.00",
                                    "4": "£131,016.00"
                                },
                                {
                                    "0": "2021",
                                    "1": "Semifinal",
                                    "2": "£26,238.00",
                                    "3": "£79,859.00",
                                    "4": "£106,097.00"
                                },
                                {
                                    "0": "2021",
                                    "1": "Weekday",
                                    "2": "£45,442.00",
                                    "3": "£121,876.00",
                                    "4": "£167,318.00"
                                },
                                {
                                    "0": "2021",
                                    "1": "All Events Value Per Year",
                                    "2": "£214,180.00",
                                    "3": "£616,170.00",
                                    "4": "£830,350.00"
                                }
                            ]
                        },
                        "text/html": "<table><tr><th>DateYear</th><th>TicketEvent</th><th>TotalTicketRefunds</th><th>TotalMerchandiseRefunds</th><th>TotalRefundsValue</th></tr><tr><td>2016</td><td>Finals</td><td>£103,478.00</td><td>£278,806.00</td><td>£382,284.00</td></tr><tr><td>2016</td><td>Play-in</td><td>£84,207.00</td><td>£264,900.00</td><td>£349,107.00</td></tr><tr><td>2016</td><td>Quarterfinal</td><td>£90,096.00</td><td>£231,044.00</td><td>£321,140.00</td></tr><tr><td>2016</td><td>Semifinal</td><td>£79,922.00</td><td>£218,995.00</td><td>£298,917.00</td></tr><tr><td>2016</td><td>Weekday</td><td>£89,646.00</td><td>£258,560.00</td><td>£348,206.00</td></tr><tr><td>2016</td><td>All Events Value Per Year</td><td>£447,349.00</td><td>£1,252,305.00</td><td>£1,699,654.00</td></tr><tr><td>2017</td><td>Finals</td><td>£102,815.00</td><td>£265,185.00</td><td>£368,000.00</td></tr><tr><td>2017</td><td>Play-in</td><td>£102,746.00</td><td>£270,410.00</td><td>£373,156.00</td></tr><tr><td>2017</td><td>Quarterfinal</td><td>£78,652.00</td><td>£255,544.00</td><td>£334,196.00</td></tr><tr><td>2017</td><td>Semifinal</td><td>£74,954.00</td><td>£181,706.00</td><td>£256,660.00</td></tr><tr><td>2017</td><td>Weekday</td><td>£81,850.00</td><td>£201,788.00</td><td>£283,638.00</td></tr><tr><td>2017</td><td>All Events Value Per Year</td><td>£441,017.00</td><td>£1,174,633.00</td><td>£1,615,650.00</td></tr><tr><td>2018</td><td>Finals</td><td>£108,633.00</td><td>£267,071.00</td><td>£375,704.00</td></tr><tr><td>2018</td><td>Play-in</td><td>£84,491.00</td><td>£232,233.00</td><td>£316,724.00</td></tr><tr><td>2018</td><td>Quarterfinal</td><td>£92,375.00</td><td>£244,819.00</td><td>£337,194.00</td></tr><tr><td>2018</td><td>Semifinal</td><td>£81,524.00</td><td>£235,683.00</td><td>£317,207.00</td></tr><tr><td>2018</td><td>Weekday</td><td>£106,156.00</td><td>£265,888.00</td><td>£372,044.00</td></tr><tr><td>2018</td><td>All Events Value Per Year</td><td>£473,179.00</td><td>£1,245,694.00</td><td>£1,718,873.00</td></tr><tr><td>2019</td><td>Finals</td><td>£113,595.00</td><td>£319,426.00</td><td>£433,021.00</td></tr><tr><td>2019</td><td>Play-in</td><td>£79,913.00</td><td>£234,531.00</td><td>£314,444.00</td></tr><tr><td>2019</td><td>Quarterfinal</td><td>£74,244.00</td><td>£184,332.00</td><td>£258,576.00</td></tr><tr><td>2019</td><td>Semifinal</td><td>£78,502.00</td><td>£218,641.00</td><td>£297,143.00</td></tr><tr><td>2019</td><td>Weekday</td><td>£104,780.00</td><td>£294,918.00</td><td>£399,698.00</td></tr><tr><td>2019</td><td>All Events Value Per Year</td><td>£451,034.00</td><td>£1,251,848.00</td><td>£1,702,882.00</td></tr><tr><td>2020</td><td>Finals</td><td>£42,495.00</td><td>£99,102.00</td><td>£141,597.00</td></tr><tr><td>2020</td><td>Play-in</td><td>£36,738.00</td><td>£105,091.00</td><td>£141,829.00</td></tr><tr><td>2020</td><td>Quarterfinal</td><td>£63,929.00</td><td>£154,055.00</td><td>£217,984.00</td></tr><tr><td>2020</td><td>Semifinal</td><td>£48,574.00</td><td>£130,389.00</td><td>£178,963.00</td></tr><tr><td>2020</td><td>Weekday</td><td>£30,373.00</td><td>£103,788.00</td><td>£134,161.00</td></tr><tr><td>2020</td><td>All Events Value Per Year</td><td>£222,109.00</td><td>£592,425.00</td><td>£814,534.00</td></tr><tr><td>2021</td><td>Finals</td><td>£56,239.00</td><td>£157,265.00</td><td>£213,504.00</td></tr><tr><td>2021</td><td>Play-in</td><td>£50,222.00</td><td>£162,193.00</td><td>£212,415.00</td></tr><tr><td>2021</td><td>Quarterfinal</td><td>£36,039.00</td><td>£94,977.00</td><td>£131,016.00</td></tr><tr><td>2021</td><td>Semifinal</td><td>£26,238.00</td><td>£79,859.00</td><td>£106,097.00</td></tr><tr><td>2021</td><td>Weekday</td><td>£45,442.00</td><td>£121,876.00</td><td>£167,318.00</td></tr><tr><td>2021</td><td>All Events Value Per Year</td><td>£214,180.00</td><td>£616,170.00</td><td>£830,350.00</td></tr></table>"
                    },
                    "metadata": {}
                }
            ],
            "execution_count": 3
        },
        {
            "cell_type": "markdown",
            "source": [
                "**Trend of spectators turnout considering the Covid-19 outbreak**"
            ],
            "metadata": {
                "azdata_cell_guid": "04a9d3f1-6ae2-4f43-acd4-bd13cdbf0633"
            },
            "attachments": {}
        },
        {
            "cell_type": "code",
            "source": [
                "SELECT\r\n",
                "    DateYear,\r\n",
                "    [MSI],\r\n",
                "    [WORLDS]\r\n",
                "FROM\r\n",
                "(\r\n",
                "SELECT    \r\n",
                "    DateYear,\r\n",
                "    EventName,\r\n",
                "    (SpectatorsNumber+VIPSpectatorsNumber)AS Total\r\n",
                "FROM    \r\n",
                "    EventDim ed, EventFact ef, DateDim dd\r\n",
                "    WHERE ef.DateID = dd.DateID AND ef.EventID = ed.EventID\r\n",
                ") up\r\n",
                "PIVOT(\r\n",
                "   SUM(Total)\r\n",
                "    FOR EventName IN ( [MSI], [WORLDS]))AS PVT\r\n",
                " ORDER BY DateYear ASC"
            ],
            "metadata": {
                "azdata_cell_guid": "455e2f09-68c7-4b58-9db1-e47b6b5919aa",
                "language": "sql"
            },
            "outputs": [
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(6 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "Total execution time: 00:00:00.040"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "execute_result",
                    "execution_count": 4,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "DateYear"
                                    },
                                    {
                                        "name": "MSI"
                                    },
                                    {
                                        "name": "WORLDS"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "2016",
                                    "1": "229078",
                                    "2": "228046"
                                },
                                {
                                    "0": "2017",
                                    "1": "211063",
                                    "2": "217887"
                                },
                                {
                                    "0": "2018",
                                    "1": "244017",
                                    "2": "207077"
                                },
                                {
                                    "0": "2019",
                                    "1": "217110",
                                    "2": "237356"
                                },
                                {
                                    "0": "2020",
                                    "1": "109134",
                                    "2": "98298"
                                },
                                {
                                    "0": "2021",
                                    "1": "132043",
                                    "2": "101630"
                                }
                            ]
                        },
                        "text/html": "<table><tr><th>DateYear</th><th>MSI</th><th>WORLDS</th></tr><tr><td>2016</td><td>229078</td><td>228046</td></tr><tr><td>2017</td><td>211063</td><td>217887</td></tr><tr><td>2018</td><td>244017</td><td>207077</td></tr><tr><td>2019</td><td>217110</td><td>237356</td></tr><tr><td>2020</td><td>109134</td><td>98298</td></tr><tr><td>2021</td><td>132043</td><td>101630</td></tr></table>"
                    },
                    "metadata": {}
                }
            ],
            "execution_count": 4
        },
        {
            "cell_type": "markdown",
            "source": [
                "**Distinct players who have won championships**"
            ],
            "metadata": {
                "language": "sql",
                "azdata_cell_guid": "509c3b01-c50b-429c-b8f5-78b01e3038c0"
            },
            "attachments": {}
        },
        {
            "cell_type": "code",
            "source": [
                "SELECT DISTINCT\r\n",
                "    p.PlayerRealName AS Player,\r\n",
                "    p.PlayerGameName AS PlayerGameName,\r\n",
                "    e.EventName AS ChampionshipWon,\r\n",
                "    e.EventYear AS Year \r\n",
                "FROM\r\n",
                "    PlayerDim p\r\n",
                "INNER JOIN PlayerInGameDim pg ON p.PlayerID = pg.PlayerID\r\n",
                "INNER JOIN GameDim g ON pg.GameID = g.GameID\r\n",
                "INNER JOIN EventDim e ON g.GameID = e.EventID\r\n",
                "INNER JOIN AwardDim a ON e.EventID = a.AwardEventID\r\n",
                "WHERE\r\n",
                "    a.AwardPosition = 1\r\n",
                "ORDER BY e.EventYear;"
            ],
            "metadata": {
                "language": "sql",
                "azdata_cell_guid": "3e91305c-71c4-49a4-a9d9-c6868ca48dee"
            },
            "outputs": [
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(102 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "Total execution time: 00:00:00.053"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "execute_result",
                    "execution_count": 5,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "Player"
                                    },
                                    {
                                        "name": "PlayerGameName"
                                    },
                                    {
                                        "name": "ChampionshipWon"
                                    },
                                    {
                                        "name": "Year"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "Agnes Rucklesse",
                                    "1": "arucklessek",
                                    "2": "Worlds",
                                    "3": "2016"
                                },
                                {
                                    "0": "Calley Le Pine",
                                    "1": "cle8v",
                                    "2": "msi",
                                    "3": "2016"
                                },
                                {
                                    "0": "Christie Jaques",
                                    "1": "cjaques4k",
                                    "2": "Worlds",
                                    "3": "2016"
                                },
                                {
                                    "0": "Devina Panniers",
                                    "1": "dpanniers4i",
                                    "2": "msi",
                                    "3": "2016"
                                },
                                {
                                    "0": "Dion Howsin",
                                    "1": "dhowsin3c",
                                    "2": "Worlds",
                                    "3": "2016"
                                },
                                {
                                    "0": "Eddy Faulconbridge",
                                    "1": "efaulconbridge5y",
                                    "2": "Worlds",
                                    "3": "2016"
                                },
                                {
                                    "0": "Ernie Privost",
                                    "1": "eprivostn",
                                    "2": "msi",
                                    "3": "2016"
                                },
                                {
                                    "0": "Frannie Vallens",
                                    "1": "fvallens1k",
                                    "2": "msi",
                                    "3": "2016"
                                },
                                {
                                    "0": "Gennie Longland",
                                    "1": "glongland86",
                                    "2": "msi",
                                    "3": "2016"
                                },
                                {
                                    "0": "Gretta Bezant",
                                    "1": "gbezant59",
                                    "2": "Worlds",
                                    "3": "2016"
                                },
                                {
                                    "0": "Hershel Dominico",
                                    "1": "hdominico68",
                                    "2": "msi",
                                    "3": "2016"
                                },
                                {
                                    "0": "Ingeborg Hambling",
                                    "1": "ihambling8j",
                                    "2": "Worlds",
                                    "3": "2016"
                                },
                                {
                                    "0": "Jinny Trevena",
                                    "1": "jtrevena4m",
                                    "2": "Worlds",
                                    "3": "2016"
                                },
                                {
                                    "0": "Kizzee Stutte",
                                    "1": "kstutte46",
                                    "2": "msi",
                                    "3": "2016"
                                },
                                {
                                    "0": "Llewellyn Burchfield",
                                    "1": "lburchfield9d",
                                    "2": "msi",
                                    "3": "2016"
                                },
                                {
                                    "0": "Lonna Brabbs",
                                    "1": "lbrabbs77",
                                    "2": "Worlds",
                                    "3": "2016"
                                },
                                {
                                    "0": "Nickey Donovan",
                                    "1": "ndonovan6f",
                                    "2": "Worlds",
                                    "3": "2016"
                                },
                                {
                                    "0": "Rica Rentalll",
                                    "1": "rrentalll6n",
                                    "2": "Worlds",
                                    "3": "2016"
                                },
                                {
                                    "0": "Sally Kuschek",
                                    "1": "skuschek9e",
                                    "2": "msi",
                                    "3": "2016"
                                },
                                {
                                    "0": "Shara Swiggs",
                                    "1": "sswiggs7t",
                                    "2": "msi",
                                    "3": "2016"
                                },
                                {
                                    "0": "Cami Stonebanks",
                                    "1": "cstonebanks7s",
                                    "2": "msi",
                                    "3": "2017"
                                },
                                {
                                    "0": "Carmina Apple",
                                    "1": "capple79",
                                    "2": "msi",
                                    "3": "2017"
                                },
                                {
                                    "0": "Cointon Colt",
                                    "1": "ccolt88",
                                    "2": "Worlds",
                                    "3": "2017"
                                },
                                {
                                    "0": "Denna Peteri",
                                    "1": "dpeteri84",
                                    "2": "msi",
                                    "3": "2017"
                                },
                                {
                                    "0": "Dona Hearst",
                                    "1": "dhearst3w",
                                    "2": "Worlds",
                                    "3": "2017"
                                },
                                {
                                    "0": "Dru McIver",
                                    "1": "dmcivert",
                                    "2": "Worlds",
                                    "3": "2017"
                                },
                                {
                                    "0": "Gilemette Bumby",
                                    "1": "gbumby2f",
                                    "2": "Worlds",
                                    "3": "2017"
                                },
                                {
                                    "0": "Laural Reinard",
                                    "1": "lreinard5s",
                                    "2": "Worlds",
                                    "3": "2017"
                                },
                                {
                                    "0": "Leland Mackie",
                                    "1": "lmackie61",
                                    "2": "msi",
                                    "3": "2017"
                                },
                                {
                                    "0": "Lorita Pauwel",
                                    "1": "lpauwel20",
                                    "2": "Worlds",
                                    "3": "2017"
                                },
                                {
                                    "0": "Margo Philpott",
                                    "1": "mphilpott43",
                                    "2": "msi",
                                    "3": "2017"
                                },
                                {
                                    "0": "Maxy Gibbard",
                                    "1": "mgibbard2p",
                                    "2": "Worlds",
                                    "3": "2017"
                                },
                                {
                                    "0": "Nance Joannet",
                                    "1": "njoannet5d",
                                    "2": "msi",
                                    "3": "2017"
                                },
                                {
                                    "0": "Radcliffe Woodus",
                                    "1": "rwoodus6g",
                                    "2": "Worlds",
                                    "3": "2017"
                                },
                                {
                                    "0": "Robbie Cuddon",
                                    "1": "rcuddon8b",
                                    "2": "Worlds",
                                    "3": "2017"
                                },
                                {
                                    "0": "Sharyl Cappineer",
                                    "1": "scappineer34",
                                    "2": "msi",
                                    "3": "2017"
                                },
                                {
                                    "0": "Shay Millan",
                                    "1": "smillan8t",
                                    "2": "msi",
                                    "3": "2017"
                                },
                                {
                                    "0": "Tallie Pettegree",
                                    "1": "tpettegree5r",
                                    "2": "Worlds",
                                    "3": "2017"
                                },
                                {
                                    "0": "Ursola Kingh",
                                    "1": "ukingh4f",
                                    "2": "msi",
                                    "3": "2017"
                                },
                                {
                                    "0": "Afton Wetheril",
                                    "1": "awetherilv",
                                    "2": "msi",
                                    "3": "2018"
                                },
                                {
                                    "0": "Aharon Huntar",
                                    "1": "ahuntar2c",
                                    "2": "Worlds",
                                    "3": "2018"
                                },
                                {
                                    "0": "Aili Forde",
                                    "1": "aforde8y",
                                    "2": "Worlds",
                                    "3": "2018"
                                },
                                {
                                    "0": "Anastasia Richings",
                                    "1": "arichings7o",
                                    "2": "Worlds",
                                    "3": "2018"
                                },
                                {
                                    "0": "Berthe McIlherran",
                                    "1": "bmcilherran1l",
                                    "2": "Worlds",
                                    "3": "2018"
                                },
                                {
                                    "0": "Bobbie Patinkin",
                                    "1": "bpatinkin8f",
                                    "2": "msi",
                                    "3": "2018"
                                },
                                {
                                    "0": "Cassie Tomaello",
                                    "1": "ctomaello6e",
                                    "2": "msi",
                                    "3": "2018"
                                },
                                {
                                    "0": "Concettina Crothers",
                                    "1": "ccrothersj",
                                    "2": "Worlds",
                                    "3": "2018"
                                },
                                {
                                    "0": "Denna Peteri",
                                    "1": "dpeteri84",
                                    "2": "Worlds",
                                    "3": "2018"
                                },
                                {
                                    "0": "Dion Howsin",
                                    "1": "dhowsin3c",
                                    "2": "msi",
                                    "3": "2018"
                                },
                                {
                                    "0": "Esteban Lucey",
                                    "1": "elucey1v",
                                    "2": "msi",
                                    "3": "2018"
                                },
                                {
                                    "0": "Gennie Longland",
                                    "1": "glongland86",
                                    "2": "Worlds",
                                    "3": "2018"
                                },
                                {
                                    "0": "Jorry Strotton",
                                    "1": "jstrotton83",
                                    "2": "Worlds",
                                    "3": "2018"
                                },
                                {
                                    "0": "Kizzee Stutte",
                                    "1": "kstutte46",
                                    "2": "msi",
                                    "3": "2018"
                                },
                                {
                                    "0": "Kristian Ramelet",
                                    "1": "kramelet58",
                                    "2": "Worlds",
                                    "3": "2018"
                                },
                                {
                                    "0": "Marmaduke Muge",
                                    "1": "mmuge63",
                                    "2": "Worlds",
                                    "3": "2018"
                                },
                                {
                                    "0": "Merrel Becaris",
                                    "1": "mbecaris2l",
                                    "2": "msi",
                                    "3": "2018"
                                },
                                {
                                    "0": "Reyna Kintish",
                                    "1": "rkintish6c",
                                    "2": "msi",
                                    "3": "2018"
                                },
                                {
                                    "0": "Sean Martinon",
                                    "1": "smartinon3t",
                                    "2": "msi",
                                    "3": "2018"
                                },
                                {
                                    "0": "Ursulina Behnen",
                                    "1": "ubehnen32",
                                    "2": "msi",
                                    "3": "2018"
                                },
                                {
                                    "0": "Brigg De Bischof",
                                    "1": "bde0",
                                    "2": "Worlds",
                                    "3": "2019"
                                },
                                {
                                    "0": "Calley Le Pine",
                                    "1": "cle8v",
                                    "2": "msi",
                                    "3": "2019"
                                },
                                {
                                    "0": "Chevy Stebbin",
                                    "1": "cstebbin5j",
                                    "2": "Worlds",
                                    "3": "2019"
                                },
                                {
                                    "0": "Dona Hearst",
                                    "1": "dhearst3w",
                                    "2": "Worlds",
                                    "3": "2019"
                                },
                                {
                                    "0": "Elsie Gerold",
                                    "1": "egerold8d",
                                    "2": "Worlds",
                                    "3": "2019"
                                },
                                {
                                    "0": "Faun Cobb",
                                    "1": "fcobbr",
                                    "2": "Worlds",
                                    "3": "2019"
                                },
                                {
                                    "0": "Hymie Oslar",
                                    "1": "hoslar1m",
                                    "2": "Worlds",
                                    "3": "2019"
                                },
                                {
                                    "0": "Kienan Aujean",
                                    "1": "kaujean6a",
                                    "2": "msi",
                                    "3": "2019"
                                },
                                {
                                    "0": "Lorita Pauwel",
                                    "1": "lpauwel20",
                                    "2": "msi",
                                    "3": "2019"
                                },
                                {
                                    "0": "Ludovika Roddick",
                                    "1": "lroddick8i",
                                    "2": "Worlds",
                                    "3": "2019"
                                },
                                {
                                    "0": "Merrel Becaris",
                                    "1": "mbecaris2l",
                                    "2": "Worlds",
                                    "3": "2019"
                                },
                                {
                                    "0": "Mireille Pahler",
                                    "1": "mpahler52",
                                    "2": "msi",
                                    "3": "2019"
                                },
                                {
                                    "0": "Neilla Storck",
                                    "1": "nstorck6l",
                                    "2": "Worlds",
                                    "3": "2019"
                                },
                                {
                                    "0": "Nickey Donovan",
                                    "1": "ndonovan6f",
                                    "2": "Worlds",
                                    "3": "2019"
                                },
                                {
                                    "0": "Rica Rentalll",
                                    "1": "rrentalll6n",
                                    "2": "msi",
                                    "3": "2019"
                                },
                                {
                                    "0": "Shae Limming",
                                    "1": "slimmingg",
                                    "2": "msi",
                                    "3": "2019"
                                },
                                {
                                    "0": "Sheree Thain",
                                    "1": "sthain4j",
                                    "2": "msi",
                                    "3": "2019"
                                },
                                {
                                    "0": "Tedda Newham",
                                    "1": "tnewham3k",
                                    "2": "msi",
                                    "3": "2019"
                                },
                                {
                                    "0": "Zorine Scolland",
                                    "1": "zscolland4h",
                                    "2": "msi",
                                    "3": "2019"
                                },
                                {
                                    "0": "Andy Noblett",
                                    "1": "anoblett8l",
                                    "2": "Worlds",
                                    "3": "2020"
                                },
                                {
                                    "0": "Angelo Avesque",
                                    "1": "aavesque2j",
                                    "2": "Worlds",
                                    "3": "2020"
                                },
                                {
                                    "0": "Bartholomeus Bettenson",
                                    "1": "bbettenson8p",
                                    "2": "Worlds",
                                    "3": "2020"
                                },
                                {
                                    "0": "Cami Stonebanks",
                                    "1": "cstonebanks7s",
                                    "2": "Worlds",
                                    "3": "2020"
                                },
                                {
                                    "0": "Dorothy Swires",
                                    "1": "dswires31",
                                    "2": "Worlds",
                                    "3": "2020"
                                },
                                {
                                    "0": "Gene Rojel",
                                    "1": "grojel5h",
                                    "2": "Worlds",
                                    "3": "2020"
                                },
                                {
                                    "0": "Jemie Ickovici",
                                    "1": "jickovici3j",
                                    "2": "Worlds",
                                    "3": "2020"
                                },
                                {
                                    "0": "Mia Chatin",
                                    "1": "mchatin5x",
                                    "2": "Worlds",
                                    "3": "2020"
                                },
                                {
                                    "0": "Rakel Curds",
                                    "1": "rcurds1i",
                                    "2": "Worlds",
                                    "3": "2020"
                                },
                                {
                                    "0": "Reg Izod",
                                    "1": "rizod5n",
                                    "2": "Worlds",
                                    "3": "2020"
                                },
                                {
                                    "0": "Rikki Rought",
                                    "1": "rrought26",
                                    "2": "Worlds",
                                    "3": "2020"
                                },
                                {
                                    "0": "Saunderson Manklow",
                                    "1": "smanklow8u",
                                    "2": "Worlds",
                                    "3": "2020"
                                },
                                {
                                    "0": "Stormy Dopson",
                                    "1": "sdopson93",
                                    "2": "Worlds",
                                    "3": "2020"
                                },
                                {
                                    "0": "Tallie Pettegree",
                                    "1": "tpettegree5r",
                                    "2": "Worlds",
                                    "3": "2020"
                                },
                                {
                                    "0": "Bruce Baseke",
                                    "1": "bbaseke4c",
                                    "2": "msi",
                                    "3": "2021"
                                },
                                {
                                    "0": "Clay Fierman",
                                    "1": "cfierman3n",
                                    "2": "msi",
                                    "3": "2021"
                                },
                                {
                                    "0": "Coleman Adamson",
                                    "1": "cadamson5q",
                                    "2": "msi",
                                    "3": "2021"
                                },
                                {
                                    "0": "Eddy Faulconbridge",
                                    "1": "efaulconbridge5y",
                                    "2": "msi",
                                    "3": "2021"
                                },
                                {
                                    "0": "Elisabetta Kleisel",
                                    "1": "ekleisel3f",
                                    "2": "msi",
                                    "3": "2021"
                                },
                                {
                                    "0": "Griz O'Ruane",
                                    "1": "goruane2h",
                                    "2": "msi",
                                    "3": "2021"
                                },
                                {
                                    "0": "Ingeborg Hambling",
                                    "1": "ihambling8j",
                                    "2": "msi",
                                    "3": "2021"
                                },
                                {
                                    "0": "Lilyan Peto",
                                    "1": "lpeto1r",
                                    "2": "msi",
                                    "3": "2021"
                                },
                                {
                                    "0": "Lou Jenne",
                                    "1": "ljenne8h",
                                    "2": "msi",
                                    "3": "2021"
                                },
                                {
                                    "0": "Patric Petegre",
                                    "1": "ppetegre1j",
                                    "2": "msi",
                                    "3": "2021"
                                }
                            ]
                        },
                        "text/html": "<table><tr><th>Player</th><th>PlayerGameName</th><th>ChampionshipWon</th><th>Year</th></tr><tr><td>Agnes Rucklesse</td><td>arucklessek</td><td>Worlds</td><td>2016</td></tr><tr><td>Calley Le Pine</td><td>cle8v</td><td>msi</td><td>2016</td></tr><tr><td>Christie Jaques</td><td>cjaques4k</td><td>Worlds</td><td>2016</td></tr><tr><td>Devina Panniers</td><td>dpanniers4i</td><td>msi</td><td>2016</td></tr><tr><td>Dion Howsin</td><td>dhowsin3c</td><td>Worlds</td><td>2016</td></tr><tr><td>Eddy Faulconbridge</td><td>efaulconbridge5y</td><td>Worlds</td><td>2016</td></tr><tr><td>Ernie Privost</td><td>eprivostn</td><td>msi</td><td>2016</td></tr><tr><td>Frannie Vallens</td><td>fvallens1k</td><td>msi</td><td>2016</td></tr><tr><td>Gennie Longland</td><td>glongland86</td><td>msi</td><td>2016</td></tr><tr><td>Gretta Bezant</td><td>gbezant59</td><td>Worlds</td><td>2016</td></tr><tr><td>Hershel Dominico</td><td>hdominico68</td><td>msi</td><td>2016</td></tr><tr><td>Ingeborg Hambling</td><td>ihambling8j</td><td>Worlds</td><td>2016</td></tr><tr><td>Jinny Trevena</td><td>jtrevena4m</td><td>Worlds</td><td>2016</td></tr><tr><td>Kizzee Stutte</td><td>kstutte46</td><td>msi</td><td>2016</td></tr><tr><td>Llewellyn Burchfield</td><td>lburchfield9d</td><td>msi</td><td>2016</td></tr><tr><td>Lonna Brabbs</td><td>lbrabbs77</td><td>Worlds</td><td>2016</td></tr><tr><td>Nickey Donovan</td><td>ndonovan6f</td><td>Worlds</td><td>2016</td></tr><tr><td>Rica Rentalll</td><td>rrentalll6n</td><td>Worlds</td><td>2016</td></tr><tr><td>Sally Kuschek</td><td>skuschek9e</td><td>msi</td><td>2016</td></tr><tr><td>Shara Swiggs</td><td>sswiggs7t</td><td>msi</td><td>2016</td></tr><tr><td>Cami Stonebanks</td><td>cstonebanks7s</td><td>msi</td><td>2017</td></tr><tr><td>Carmina Apple</td><td>capple79</td><td>msi</td><td>2017</td></tr><tr><td>Cointon Colt</td><td>ccolt88</td><td>Worlds</td><td>2017</td></tr><tr><td>Denna Peteri</td><td>dpeteri84</td><td>msi</td><td>2017</td></tr><tr><td>Dona Hearst</td><td>dhearst3w</td><td>Worlds</td><td>2017</td></tr><tr><td>Dru McIver</td><td>dmcivert</td><td>Worlds</td><td>2017</td></tr><tr><td>Gilemette Bumby</td><td>gbumby2f</td><td>Worlds</td><td>2017</td></tr><tr><td>Laural Reinard</td><td>lreinard5s</td><td>Worlds</td><td>2017</td></tr><tr><td>Leland Mackie</td><td>lmackie61</td><td>msi</td><td>2017</td></tr><tr><td>Lorita Pauwel</td><td>lpauwel20</td><td>Worlds</td><td>2017</td></tr><tr><td>Margo Philpott</td><td>mphilpott43</td><td>msi</td><td>2017</td></tr><tr><td>Maxy Gibbard</td><td>mgibbard2p</td><td>Worlds</td><td>2017</td></tr><tr><td>Nance Joannet</td><td>njoannet5d</td><td>msi</td><td>2017</td></tr><tr><td>Radcliffe Woodus</td><td>rwoodus6g</td><td>Worlds</td><td>2017</td></tr><tr><td>Robbie Cuddon</td><td>rcuddon8b</td><td>Worlds</td><td>2017</td></tr><tr><td>Sharyl Cappineer</td><td>scappineer34</td><td>msi</td><td>2017</td></tr><tr><td>Shay Millan</td><td>smillan8t</td><td>msi</td><td>2017</td></tr><tr><td>Tallie Pettegree</td><td>tpettegree5r</td><td>Worlds</td><td>2017</td></tr><tr><td>Ursola Kingh</td><td>ukingh4f</td><td>msi</td><td>2017</td></tr><tr><td>Afton Wetheril</td><td>awetherilv</td><td>msi</td><td>2018</td></tr><tr><td>Aharon Huntar</td><td>ahuntar2c</td><td>Worlds</td><td>2018</td></tr><tr><td>Aili Forde</td><td>aforde8y</td><td>Worlds</td><td>2018</td></tr><tr><td>Anastasia Richings</td><td>arichings7o</td><td>Worlds</td><td>2018</td></tr><tr><td>Berthe McIlherran</td><td>bmcilherran1l</td><td>Worlds</td><td>2018</td></tr><tr><td>Bobbie Patinkin</td><td>bpatinkin8f</td><td>msi</td><td>2018</td></tr><tr><td>Cassie Tomaello</td><td>ctomaello6e</td><td>msi</td><td>2018</td></tr><tr><td>Concettina Crothers</td><td>ccrothersj</td><td>Worlds</td><td>2018</td></tr><tr><td>Denna Peteri</td><td>dpeteri84</td><td>Worlds</td><td>2018</td></tr><tr><td>Dion Howsin</td><td>dhowsin3c</td><td>msi</td><td>2018</td></tr><tr><td>Esteban Lucey</td><td>elucey1v</td><td>msi</td><td>2018</td></tr><tr><td>Gennie Longland</td><td>glongland86</td><td>Worlds</td><td>2018</td></tr><tr><td>Jorry Strotton</td><td>jstrotton83</td><td>Worlds</td><td>2018</td></tr><tr><td>Kizzee Stutte</td><td>kstutte46</td><td>msi</td><td>2018</td></tr><tr><td>Kristian Ramelet</td><td>kramelet58</td><td>Worlds</td><td>2018</td></tr><tr><td>Marmaduke Muge</td><td>mmuge63</td><td>Worlds</td><td>2018</td></tr><tr><td>Merrel Becaris</td><td>mbecaris2l</td><td>msi</td><td>2018</td></tr><tr><td>Reyna Kintish</td><td>rkintish6c</td><td>msi</td><td>2018</td></tr><tr><td>Sean Martinon</td><td>smartinon3t</td><td>msi</td><td>2018</td></tr><tr><td>Ursulina Behnen</td><td>ubehnen32</td><td>msi</td><td>2018</td></tr><tr><td>Brigg De Bischof</td><td>bde0</td><td>Worlds</td><td>2019</td></tr><tr><td>Calley Le Pine</td><td>cle8v</td><td>msi</td><td>2019</td></tr><tr><td>Chevy Stebbin</td><td>cstebbin5j</td><td>Worlds</td><td>2019</td></tr><tr><td>Dona Hearst</td><td>dhearst3w</td><td>Worlds</td><td>2019</td></tr><tr><td>Elsie Gerold</td><td>egerold8d</td><td>Worlds</td><td>2019</td></tr><tr><td>Faun Cobb</td><td>fcobbr</td><td>Worlds</td><td>2019</td></tr><tr><td>Hymie Oslar</td><td>hoslar1m</td><td>Worlds</td><td>2019</td></tr><tr><td>Kienan Aujean</td><td>kaujean6a</td><td>msi</td><td>2019</td></tr><tr><td>Lorita Pauwel</td><td>lpauwel20</td><td>msi</td><td>2019</td></tr><tr><td>Ludovika Roddick</td><td>lroddick8i</td><td>Worlds</td><td>2019</td></tr><tr><td>Merrel Becaris</td><td>mbecaris2l</td><td>Worlds</td><td>2019</td></tr><tr><td>Mireille Pahler</td><td>mpahler52</td><td>msi</td><td>2019</td></tr><tr><td>Neilla Storck</td><td>nstorck6l</td><td>Worlds</td><td>2019</td></tr><tr><td>Nickey Donovan</td><td>ndonovan6f</td><td>Worlds</td><td>2019</td></tr><tr><td>Rica Rentalll</td><td>rrentalll6n</td><td>msi</td><td>2019</td></tr><tr><td>Shae Limming</td><td>slimmingg</td><td>msi</td><td>2019</td></tr><tr><td>Sheree Thain</td><td>sthain4j</td><td>msi</td><td>2019</td></tr><tr><td>Tedda Newham</td><td>tnewham3k</td><td>msi</td><td>2019</td></tr><tr><td>Zorine Scolland</td><td>zscolland4h</td><td>msi</td><td>2019</td></tr><tr><td>Andy Noblett</td><td>anoblett8l</td><td>Worlds</td><td>2020</td></tr><tr><td>Angelo Avesque</td><td>aavesque2j</td><td>Worlds</td><td>2020</td></tr><tr><td>Bartholomeus Bettenson</td><td>bbettenson8p</td><td>Worlds</td><td>2020</td></tr><tr><td>Cami Stonebanks</td><td>cstonebanks7s</td><td>Worlds</td><td>2020</td></tr><tr><td>Dorothy Swires</td><td>dswires31</td><td>Worlds</td><td>2020</td></tr><tr><td>Gene Rojel</td><td>grojel5h</td><td>Worlds</td><td>2020</td></tr><tr><td>Jemie Ickovici</td><td>jickovici3j</td><td>Worlds</td><td>2020</td></tr><tr><td>Mia Chatin</td><td>mchatin5x</td><td>Worlds</td><td>2020</td></tr><tr><td>Rakel Curds</td><td>rcurds1i</td><td>Worlds</td><td>2020</td></tr><tr><td>Reg Izod</td><td>rizod5n</td><td>Worlds</td><td>2020</td></tr><tr><td>Rikki Rought</td><td>rrought26</td><td>Worlds</td><td>2020</td></tr><tr><td>Saunderson Manklow</td><td>smanklow8u</td><td>Worlds</td><td>2020</td></tr><tr><td>Stormy Dopson</td><td>sdopson93</td><td>Worlds</td><td>2020</td></tr><tr><td>Tallie Pettegree</td><td>tpettegree5r</td><td>Worlds</td><td>2020</td></tr><tr><td>Bruce Baseke</td><td>bbaseke4c</td><td>msi</td><td>2021</td></tr><tr><td>Clay Fierman</td><td>cfierman3n</td><td>msi</td><td>2021</td></tr><tr><td>Coleman Adamson</td><td>cadamson5q</td><td>msi</td><td>2021</td></tr><tr><td>Eddy Faulconbridge</td><td>efaulconbridge5y</td><td>msi</td><td>2021</td></tr><tr><td>Elisabetta Kleisel</td><td>ekleisel3f</td><td>msi</td><td>2021</td></tr><tr><td>Griz O'Ruane</td><td>goruane2h</td><td>msi</td><td>2021</td></tr><tr><td>Ingeborg Hambling</td><td>ihambling8j</td><td>msi</td><td>2021</td></tr><tr><td>Lilyan Peto</td><td>lpeto1r</td><td>msi</td><td>2021</td></tr><tr><td>Lou Jenne</td><td>ljenne8h</td><td>msi</td><td>2021</td></tr><tr><td>Patric Petegre</td><td>ppetegre1j</td><td>msi</td><td>2021</td></tr></table>"
                    },
                    "metadata": {}
                }
            ],
            "execution_count": 5
        }
    ]
}