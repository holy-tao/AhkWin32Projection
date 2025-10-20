#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ITraceEventCallback extends IUnknown{
    /**
     * The interface identifier for ITraceEventCallback
     * @type {Guid}
     */
    static IID => Guid("{3ed25501-593f-43e9-8f38-3ab46f5a4a52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITraceEvent>} HeaderEvent 
     * @param {Pointer<ITraceRelogger>} Relogger 
     * @returns {HRESULT} 
     */
    OnBeginProcessTrace(HeaderEvent, Relogger) {
        result := ComCall(3, this, "ptr", HeaderEvent, "ptr", Relogger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITraceRelogger>} Relogger 
     * @returns {HRESULT} 
     */
    OnFinalizeProcessTrace(Relogger) {
        result := ComCall(4, this, "ptr", Relogger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITraceEvent>} Event 
     * @param {Pointer<ITraceRelogger>} Relogger 
     * @returns {HRESULT} 
     */
    OnEvent(Event, Relogger) {
        result := ComCall(5, this, "ptr", Event, "ptr", Relogger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
