#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IGPMGPO2.ahk

/**
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMGPO3 extends IGPMGPO2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMGPO3
     * @type {Guid}
     */
    static IID => Guid("{7cf123a1-f94a-4112-bfae-6aa1db9cb248}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 38

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InfrastructureDC", "put_InfrastructureDC", "put_InfrastructureFlags"]

    /**
     * @type {BSTR} 
     */
    InfrastructureDC {
        get => this.get_InfrastructureDC()
        set => this.put_InfrastructureDC(value)
    }

    /**
     * @type {HRESULT} 
     */
    InfrastructureFlags {
        set => this.put_InfrastructureFlags(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_InfrastructureDC() {
        pVal := BSTR()
        result := ComCall(38, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_InfrastructureDC(newVal) {
        if(newVal is String) {
            pin := BSTR.Alloc(newVal)
            newVal := pin.Value
        }

        result := ComCall(39, this, "ptr", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    put_InfrastructureFlags(dwFlags) {
        result := ComCall(40, this, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
