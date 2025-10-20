#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptProfilerControl extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} clsidProfilerObject 
     * @param {Integer} dwEventMask 
     * @param {Integer} dwContext 
     * @returns {HRESULT} 
     */
    StartProfiling(clsidProfilerObject, dwEventMask, dwContext) {
        result := ComCall(3, this, "ptr", clsidProfilerObject, "uint", dwEventMask, "uint", dwContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwEventMask 
     * @returns {HRESULT} 
     */
    SetProfilerEventMask(dwEventMask) {
        result := ComCall(4, this, "uint", dwEventMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hrShutdownReason 
     * @returns {HRESULT} 
     */
    StopProfiling(hrShutdownReason) {
        result := ComCall(5, this, "int", hrShutdownReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
