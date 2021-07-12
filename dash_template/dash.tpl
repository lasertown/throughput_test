{
    "lenses": {
      "0": {
        "order": 0,
        "parts": {
          "0": {
            "position": {
              "x": 0,
              "y": 0,
              "colSpan": 6,
              "rowSpan": 4
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${sub_id}/resourceGroups/${resource_group}/providers/Microsoft.Compute/virtualMachines/${node_name}"
                          },
                          "name": "Data Disk Read Bytes/sec",
                          "aggregationType": 4,
                          "namespace": "microsoft.compute/virtualmachines",
                          "metricVisualization": {
                            "displayName": "Data Disk Read Bytes/Sec"
                          }
                        }
                      ],
                      "title": "Avg Data Disk Read Bytes/Sec by LUN",
                      "titleKind": 1,
                      "visualization": {
                        "chartType": 2,
                        "legendVisualization": {
                          "isVisible": true,
                          "position": 2,
                          "hideSubtitle": false
                        },
                        "axisVisualization": {
                          "x": {
                            "isVisible": true,
                            "axisType": 2
                          },
                          "y": {
                            "isVisible": true,
                            "axisType": 1
                          }
                        }
                      },
                      "grouping": {
                        "dimension": "LUN",
                        "sort": 2,
                        "top": 10
                      },
                      "timespan": {
                        "relative": {
                          "duration": 43200000
                        },
                        "showUTCTime": false,
                        "grain": 2
                      }
                    }
                  },
                  "isOptional": true
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart"
            }
          }
        }
      }
    },
    "metadata": {
      "model": {
        "timeRange": {
          "value": {
            "relative": {
              "duration": 24,
              "timeUnit": 1
            }
          },
          "type": "MsPortalFx.Composition.Configuration.ValueTypes.TimeRange"
        },
        "filterLocale": {
          "value": "en-us"
        },
        "filters": {
          "value": {
            "MsPortalFx_TimeRange": {
              "model": {
                "format": "utc",
                "granularity": "auto",
                "relative": "24h"
              },
              "displayCache": {
                "name": "UTC Time",
                "value": "Past 24 hours"
              },
              "filteredPartIds": []
            }
          }
        }
      }
    }
}
