#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMPEG2ComponentType.ahk

/**
 * The IATSCComponentType interface represents a component type for a component in an ATSC broadcast. The ATSCComponentType object exposes this interface. Use this interface to determine if an audio stream is in AC-3 format.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IATSCComponentType)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iatsccomponenttype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IATSCComponentType extends IMPEG2ComponentType{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IATSCComponentType
     * @type {Guid}
     */
    static IID => Guid("{fc189e4d-7bd4-4125-b3b3-3a76a332cc96}")

    /**
     * The class identifier for ATSCComponentType
     * @type {Guid}
     */
    static CLSID => Guid("{a8dcf3d5-0780-4ef4-8a83-2cffaacb8ace}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Flags", "put_Flags"]

    /**
     * 
     * @param {Pointer<Integer>} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsccomponenttype-get_flags
     */
    get_Flags(Flags) {
        FlagsMarshal := Flags is VarRef ? "int*" : "ptr"

        result := ComCall(28, this, FlagsMarshal, Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsccomponenttype-put_flags
     */
    put_Flags(flags) {
        result := ComCall(29, this, "int", flags, "HRESULT")
        return result
    }
}
