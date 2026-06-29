#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * The APOInitBaseStruct structure is the base initialization header that must precede other initialization data in IAudioProcessingObject::Initialize.
 * @remarks
 * If the specified CLSID does not match, then the APOInitBaseStruct structure was not designed for this APO, and this is an error condition.  And if the CLSID of the APO changes  
 *     between versions, then the CLSID may also be used for version management.  In the case where the CLSID is used for version management, a previous version may still be supported by the APO.
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/ns-audioenginebaseapo-apoinitbasestruct
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct APOInitBaseStruct {
    #StructPack 4

    /**
     * The total size of the structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * The Class ID (CLSID) of the APO.
     */
    clsid : Guid

}
