#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptProfilerControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptProfilerControl
     * @type {Guid}
     */
    static IID => Guid("{784b5ff0-69b0-47d1-a7dc-2518f4230e90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartProfiling", "SetProfilerEventMask", "StopProfiling"]

    /**
     * 
     * @param {Pointer<Guid>} clsidProfilerObject 
     * @param {Integer} dwEventMask 
     * @param {Integer} dwContext 
     * @returns {HRESULT} 
     */
    StartProfiling(clsidProfilerObject, dwEventMask, dwContext) {
        result := ComCall(3, this, "ptr", clsidProfilerObject, "uint", dwEventMask, "uint", dwContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEventMask 
     * @returns {HRESULT} 
     */
    SetProfilerEventMask(dwEventMask) {
        result := ComCall(4, this, "uint", dwEventMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrShutdownReason 
     * @returns {HRESULT} 
     */
    StopProfiling(hrShutdownReason) {
        result := ComCall(5, this, "int", hrShutdownReason, "HRESULT")
        return result
    }
}
