#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHelper
     * @type {Guid}
     */
    static IID => Guid("{51973c3f-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The class identifier for DebugHelper
     * @type {Guid}
     */
    static CLSID => Guid("{0bfcc060-8c1d-11d0-accd-00aa0060275c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePropertyBrowser", "CreatePropertyBrowserEx", "CreateSimpleConnectionPoint"]

    /**
     * 
     * @param {Pointer<VARIANT>} pvar 
     * @param {PWSTR} bstrName 
     * @param {IDebugApplicationThread} pdat 
     * @param {Pointer<IDebugProperty>} ppdob 
     * @returns {HRESULT} 
     */
    CreatePropertyBrowser(pvar, bstrName, pdat, ppdob) {
        bstrName := bstrName is String ? StrPtr(bstrName) : bstrName

        result := ComCall(3, this, "ptr", pvar, "ptr", bstrName, "ptr", pdat, "ptr*", ppdob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvar 
     * @param {PWSTR} bstrName 
     * @param {IDebugApplicationThread} pdat 
     * @param {IDebugFormatter} pdf 
     * @param {Pointer<IDebugProperty>} ppdob 
     * @returns {HRESULT} 
     */
    CreatePropertyBrowserEx(pvar, bstrName, pdat, pdf, ppdob) {
        bstrName := bstrName is String ? StrPtr(bstrName) : bstrName

        result := ComCall(4, this, "ptr", pvar, "ptr", bstrName, "ptr", pdat, "ptr", pdf, "ptr*", ppdob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pdisp 
     * @param {Pointer<ISimpleConnectionPoint>} ppscp 
     * @returns {HRESULT} 
     */
    CreateSimpleConnectionPoint(pdisp, ppscp) {
        result := ComCall(5, this, "ptr", pdisp, "ptr*", ppscp, "HRESULT")
        return result
    }
}
