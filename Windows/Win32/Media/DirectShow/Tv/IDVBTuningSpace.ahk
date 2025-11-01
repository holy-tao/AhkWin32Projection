#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITuningSpace.ahk

/**
 * The IDVBTuningSpace interface is implemented on the DVBTuningSpace object.Note  New applications should use the IDVBTuningSpace2 interface, which inherits IDVBTuningSpace and adds additional methods. .
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBTuningSpace)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-idvbtuningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDVBTuningSpace extends ITuningSpace{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDVBTuningSpace
     * @type {Guid}
     */
    static IID => Guid("{ada0b268-3b19-4e5b-acc4-49f852be13ba}")

    /**
     * The class identifier for DVBTuningSpace
     * @type {Guid}
     */
    static CLSID => Guid("{c6b14b32-76aa-4a86-a7ac-5c79aaf58da7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SystemType", "put_SystemType"]

    /**
     * 
     * @param {Pointer<Integer>} SysType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtuningspace-get_systemtype
     */
    get_SystemType(SysType) {
        SysTypeMarshal := SysType is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, SysTypeMarshal, SysType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SysType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtuningspace-put_systemtype
     */
    put_SystemType(SysType) {
        result := ComCall(27, this, "int", SysType, "HRESULT")
        return result
    }
}
