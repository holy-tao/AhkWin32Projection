#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostSecurityContext extends IUnknown{
    /**
     * The interface identifier for IHostSecurityContext
     * @type {Guid}
     */
    static IID => Guid("{7e573ce4-0343-4423-98d7-6318348a1d3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IHostSecurityContext>} ppClonedContext 
     * @returns {HRESULT} 
     */
    Capture(ppClonedContext) {
        result := ComCall(3, this, "ptr", ppClonedContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
