#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\Collections\IVector.ahk
#Include .\AppUriHandlerHost.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppUriHandlerRegistration2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppUriHandlerRegistration2
     * @type {Guid}
     */
    static IID => Guid("{d54dac97-cb39-5f1f-883e-01853730bd6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAllHosts", "UpdateHosts", "get_PackageFamilyName"]

    /**
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
    }

    /**
     * 
     * @returns {IVector<AppUriHandlerHost>} 
     */
    GetAllHosts() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(AppUriHandlerHost, result_)
    }

    /**
     * 
     * @param {IIterable<AppUriHandlerHost>} hosts 
     * @returns {HRESULT} 
     */
    UpdateHosts(hosts) {
        result := ComCall(7, this, "ptr", hosts, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
