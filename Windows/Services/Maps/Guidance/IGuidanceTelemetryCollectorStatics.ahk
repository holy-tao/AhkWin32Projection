#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GuidanceTelemetryCollector.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class IGuidanceTelemetryCollectorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuidanceTelemetryCollectorStatics
     * @type {Guid}
     */
    static IID => Guid("{36532047-f160-44fb-b578-94577ca05990}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrent"]

    /**
     * The GetCurrentActCtx function returns the handle to the active activation context of the calling thread.
     * @remarks
     * The calling thread is responsible for releasing the handle of the returned activation context. This function can return a null handle if no activation contexts have been activated by this thread. This is not an error.
     * @returns {GuidanceTelemetryCollector} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-getcurrentactctx
     */
    GetCurrent() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GuidanceTelemetryCollector(result_)
    }
}
