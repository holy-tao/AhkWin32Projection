#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RETRIEVAL_POINTERS_BUFFER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STREAM_EXTENT_ENTRY extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    class _ExtentInformation extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {RETRIEVAL_POINTERS_BUFFER}
         */
        RetrievalPointers {
            get {
                if(!this.HasProp("__RetrievalPointers"))
                    this.__RetrievalPointers := RETRIEVAL_POINTERS_BUFFER(0, this)
                return this.__RetrievalPointers
            }
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {_ExtentInformation}
     */
    ExtentInformation {
        get {
            if(!this.HasProp("__ExtentInformation"))
                this.__ExtentInformation := STREAM_EXTENT_ENTRY._ExtentInformation(8, this)
            return this.__ExtentInformation
        }
    }
}
