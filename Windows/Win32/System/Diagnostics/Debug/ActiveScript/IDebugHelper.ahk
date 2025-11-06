#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\IDebugProperty.ahk
#Include .\ISimpleConnectionPoint.ahk
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
     * @returns {IDebugProperty} 
     */
    CreatePropertyBrowser(pvar, bstrName, pdat) {
        bstrName := bstrName is String ? StrPtr(bstrName) : bstrName

        result := ComCall(3, this, "ptr", pvar, "ptr", bstrName, "ptr", pdat, "ptr*", &ppdob := 0, "HRESULT")
        return IDebugProperty(ppdob)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvar 
     * @param {PWSTR} bstrName 
     * @param {IDebugApplicationThread} pdat 
     * @param {IDebugFormatter} pdf 
     * @returns {IDebugProperty} 
     */
    CreatePropertyBrowserEx(pvar, bstrName, pdat, pdf) {
        bstrName := bstrName is String ? StrPtr(bstrName) : bstrName

        result := ComCall(4, this, "ptr", pvar, "ptr", bstrName, "ptr", pdat, "ptr", pdf, "ptr*", &ppdob := 0, "HRESULT")
        return IDebugProperty(ppdob)
    }

    /**
     * 
     * @param {IDispatch} pdisp 
     * @returns {ISimpleConnectionPoint} 
     */
    CreateSimpleConnectionPoint(pdisp) {
        result := ComCall(5, this, "ptr", pdisp, "ptr*", &ppscp := 0, "HRESULT")
        return ISimpleConnectionPoint(ppscp)
    }
}
