#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * The APOInitBaseStruct structure is the base initialization header that must precede other initialization data in IAudioProcessingObject::Initialize.
 * @remarks
 * If the specified CLSID does not match, then the APOInitBaseStruct structure was not designed for this APO, and this is an error condition.  And if the CLSID of the APO changes  
 *     between versions, then the CLSID may also be used for version management.  In the case where the CLSID is used for version management, a previous version may still be supported by the APO.
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/ns-audioenginebaseapo-apoinitbasestruct
 * @namespace Windows.Win32.Media.Audio.Apo
 */
class APOInitBaseStruct extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

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
     * @type {Guid}
     */
    clsid {
        get {
            if(!this.HasProp("__clsid"))
                this.__clsid := Guid(4, this)
            return this.__clsid
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 20
    }
}
