#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Determines the type of data to return from a given data point on the graph.
 * @see https://learn.microsoft.com/windows/win32/api/isysmon/ne-isysmon-sysmondatatype
 * @namespace Windows.Win32.System.Performance
 */
export default struct SysmonDataType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Average value of the counter.
     * @type {Integer (Int32)}
     */
    static sysmonDataAvg => 1

    /**
     * Minimum value of the counter.
     * @type {Integer (Int32)}
     */
    static sysmonDataMin => 2

    /**
     * Maximum value of the counter.
     * @type {Integer (Int32)}
     */
    static sysmonDataMax => 3

    /**
     * Date and time that the counter value was collected. If SYSMON compresses more than one sample into the counter value, the date and time are from the last sample.
     * @type {Integer (Int32)}
     */
    static sysmonDataTime => 4

    /**
     * Number of samples that were compressed into the data point.
     * @type {Integer (Int32)}
     */
    static sysmonDataCount => 5
}
