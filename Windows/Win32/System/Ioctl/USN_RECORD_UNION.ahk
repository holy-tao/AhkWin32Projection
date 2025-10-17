#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USN_RECORD_COMMON_HEADER.ahk
#Include .\USN_RECORD_V2.ahk
#Include ..\..\Storage\FileSystem\FILE_ID_128.ahk
#Include .\USN_RECORD_V3.ahk
#Include .\USN_RECORD_EXTENT.ahk
#Include .\USN_RECORD_V4.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class USN_RECORD_UNION extends Win32Struct
{
    static sizeof => 224

    static packingSize => 8

    /**
     * @type {USN_RECORD_COMMON_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := USN_RECORD_COMMON_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {USN_RECORD_V2}
     */
    V2{
        get {
            if(!this.HasProp("__V2"))
                this.__V2 := USN_RECORD_V2(0, this)
            return this.__V2
        }
    }

    /**
     * @type {USN_RECORD_V3}
     */
    V3{
        get {
            if(!this.HasProp("__V3"))
                this.__V3 := USN_RECORD_V3(0, this)
            return this.__V3
        }
    }

    /**
     * @type {USN_RECORD_V4}
     */
    V4{
        get {
            if(!this.HasProp("__V4"))
                this.__V4 := USN_RECORD_V4(0, this)
            return this.__V4
        }
    }
}
