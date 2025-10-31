#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScript extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScript
     * @type {Guid}
     */
    static IID => Guid("{bb1a2ae1-a4f9-11cf-8f20-00805f2cd064}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetScriptSite", "GetScriptSite", "SetScriptState", "GetScriptState", "Close", "AddNamedItem", "AddTypeLib", "GetScriptDispatch", "GetCurrentScriptThreadID", "GetScriptThreadID", "GetScriptThreadState", "InterruptScriptThread", "Clone"]

    /**
     * 
     * @param {IActiveScriptSite} pass 
     * @returns {HRESULT} 
     */
    SetScriptSite(pass) {
        result := ComCall(3, this, "ptr", pass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     */
    GetScriptSite(riid, ppvObject) {
        result := ComCall(4, this, "ptr", riid, "ptr*", ppvObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ss 
     * @returns {HRESULT} 
     */
    SetScriptState(ss) {
        result := ComCall(5, this, "int", ss, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pssState 
     * @returns {HRESULT} 
     */
    GetScriptState(pssState) {
        result := ComCall(6, this, "int*", pssState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrName 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    AddNamedItem(pstrName, dwFlags) {
        pstrName := pstrName is String ? StrPtr(pstrName) : pstrName

        result := ComCall(8, this, "ptr", pstrName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidTypeLib 
     * @param {Integer} dwMajor 
     * @param {Integer} dwMinor 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    AddTypeLib(rguidTypeLib, dwMajor, dwMinor, dwFlags) {
        result := ComCall(9, this, "ptr", rguidTypeLib, "uint", dwMajor, "uint", dwMinor, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrItemName 
     * @param {Pointer<IDispatch>} ppdisp 
     * @returns {HRESULT} 
     */
    GetScriptDispatch(pstrItemName, ppdisp) {
        pstrItemName := pstrItemName is String ? StrPtr(pstrItemName) : pstrItemName

        result := ComCall(10, this, "ptr", pstrItemName, "ptr*", ppdisp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pstidThread 
     * @returns {HRESULT} 
     */
    GetCurrentScriptThreadID(pstidThread) {
        result := ComCall(11, this, "uint*", pstidThread, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwWin32ThreadId 
     * @param {Pointer<Integer>} pstidThread 
     * @returns {HRESULT} 
     */
    GetScriptThreadID(dwWin32ThreadId, pstidThread) {
        result := ComCall(12, this, "uint", dwWin32ThreadId, "uint*", pstidThread, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} stidThread 
     * @param {Pointer<Integer>} pstsState 
     * @returns {HRESULT} 
     */
    GetScriptThreadState(stidThread, pstsState) {
        result := ComCall(13, this, "uint", stidThread, "int*", pstsState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} stidThread 
     * @param {Pointer<EXCEPINFO>} pexcepinfo 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    InterruptScriptThread(stidThread, pexcepinfo, dwFlags) {
        result := ComCall(14, this, "uint", stidThread, "ptr", pexcepinfo, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IActiveScript>} ppscript 
     * @returns {HRESULT} 
     */
    Clone(ppscript) {
        result := ComCall(15, this, "ptr*", ppscript, "HRESULT")
        return result
    }
}
