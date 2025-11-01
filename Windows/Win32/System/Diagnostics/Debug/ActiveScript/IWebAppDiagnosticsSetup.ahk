#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IWebAppDiagnosticsSetup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAppDiagnosticsSetup
     * @type {Guid}
     */
    static IID => Guid("{379bfbe1-c6c9-432a-93e1-6d17656c538c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DiagnosticsSupported", "CreateObjectWithSiteAtWebApp"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pRetVal 
     * @returns {HRESULT} 
     */
    DiagnosticsSupported(pRetVal) {
        result := ComCall(3, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer} hPassToObject 
     * @returns {HRESULT} 
     */
    CreateObjectWithSiteAtWebApp(rclsid, dwClsContext, riid, hPassToObject) {
        result := ComCall(4, this, "ptr", rclsid, "uint", dwClsContext, "ptr", riid, "ptr", hPassToObject, "HRESULT")
        return result
    }
}
