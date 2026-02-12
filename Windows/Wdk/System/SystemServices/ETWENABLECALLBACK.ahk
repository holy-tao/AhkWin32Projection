#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class ETWENABLECALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Guid>} SourceId 
     * @param {Integer} ControlCode 
     * @param {Integer} Level 
     * @param {Integer} MatchAnyKeyword 
     * @param {Integer} MatchAllKeyword 
     * @param {Pointer<EVENT_FILTER_DESCRIPTOR>} FilterData 
     * @param {Pointer<Void>} CallbackContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(SourceId, ControlCode, Level, MatchAnyKeyword, MatchAllKeyword, FilterData, CallbackContext) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", SourceId, "uint", ControlCode, "char", Level, "uint", MatchAnyKeyword, "uint", MatchAllKeyword, "ptr", FilterData, CallbackContextMarshal, CallbackContext)
    }
}
