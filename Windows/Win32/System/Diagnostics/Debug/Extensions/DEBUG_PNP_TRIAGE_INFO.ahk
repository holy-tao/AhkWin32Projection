#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_PNP_TRIAGE_INFO {
    #StructPack 8

    SizeOfStruct : UInt32

    Lock_Address : Int64

    Lock_ActiveCount : Int32

    Lock_ContentionCount : UInt32

    Lock_NumberOfExclusiveWaiters : UInt32

    Lock_NumberOfSharedWaiters : UInt32

    Lock_Flag : UInt16

    TriagedThread : Int64

    ThreadCount : Int32

    TriagedThread_WaitTime : Int64

}
