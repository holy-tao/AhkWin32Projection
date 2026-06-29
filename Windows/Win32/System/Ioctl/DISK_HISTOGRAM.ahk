#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HISTOGRAM_BUCKET.ahk" { HISTOGRAM_BUCKET }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DISK_HISTOGRAM {
    #StructPack 8

    DiskSize : Int64

    Start : Int64

    End : Int64

    Average : Int64

    AverageRead : Int64

    AverageWrite : Int64

    Granularity : UInt32

    Size : UInt32

    ReadCount : UInt32

    WriteCount : UInt32

    Histogram : HISTOGRAM_BUCKET.Ptr

}
