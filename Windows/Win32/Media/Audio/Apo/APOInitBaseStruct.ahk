#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The APOInitBaseStruct structure is the base initialization header that must precede other initialization data in IAudioProcessingObject::Initialize.
 * @remarks
 * 
  * If the specified CLSID does not match, then the APOInitBaseStruct structure was not designed for this APO, and this is an error condition.  And if the CLSID of the APO changes  
  *     between versions, then the CLSID may also be used for version management.  In the case where the CLSID is used for version management, a previous version may still be supported by the APO.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/ns-audioenginebaseapo-apoinitbasestruct
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APOInitBaseStruct extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The total size of the structure in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The Class ID (CLSID) of the APO.
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 16
    }
}
