#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the different Quality of Service (QoS) metrics that can be measured in this API.
  * 
  * > [!IMPORTANT]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemetric
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveQualityOfServiceMetric extends Win32Enum{

    /**
     * Average latency, in milliseconds.
     * @type {Integer (Int32)}
     */
    static AverageLatencyInMilliseconds => 0

    /**
     * Minimum latency, in milliseconds.
     * @type {Integer (Int32)}
     */
    static MinLatencyInMilliseconds => 1

    /**
     * Maximum latency, in milliseconds.
     * @type {Integer (Int32)}
     */
    static MaxLatencyInMilliseconds => 2

    /**
     * Average outbound bits per second.
     * @type {Integer (Int32)}
     */
    static AverageOutboundBitsPerSecond => 3

    /**
     * Minimum outbound bits per second.
     * @type {Integer (Int32)}
     */
    static MinOutboundBitsPerSecond => 4

    /**
     * Maximum outbound bits per second.
     * @type {Integer (Int32)}
     */
    static MaxOutboundBitsPerSecond => 5

    /**
     * Average inbound bits per second.
     * @type {Integer (Int32)}
     */
    static AverageInboundBitsPerSecond => 6

    /**
     * Minimum inbound bits per second.
     * @type {Integer (Int32)}
     */
    static MinInboundBitsPerSecond => 7

    /**
     * Maximum inbound bits per second.
     * @type {Integer (Int32)}
     */
    static MaxInboundBitsPerSecond => 8
}
