#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Used to examine and configure Remote Desktop Services user properties.
 * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nn-tsuserex-iadstsuserex
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IADsTSUserEx extends IDispatch{
    /**
     * The interface identifier for IADsTSUserEx
     * @type {Guid}
     */
    static IID => Guid("{c4930e79-2989-4462-8a60-2fcf2f2955ef}")

    /**
     * The class identifier for ADsTSUserEx
     * @type {Guid}
     */
    static CLSID => Guid("{e2e9cae6-1e7b-4b8e-babd-e9bf6292ac29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_TerminalServicesProfilePath(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pNewVal 
     * @returns {HRESULT} 
     */
    put_TerminalServicesProfilePath(pNewVal) {
        pNewVal := pNewVal is String ? BSTR.Alloc(pNewVal).Value : pNewVal

        result := ComCall(8, this, "ptr", pNewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_TerminalServicesHomeDirectory(pVal) {
        result := ComCall(9, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pNewVal 
     * @returns {HRESULT} 
     */
    put_TerminalServicesHomeDirectory(pNewVal) {
        pNewVal := pNewVal is String ? BSTR.Alloc(pNewVal).Value : pNewVal

        result := ComCall(10, this, "ptr", pNewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_TerminalServicesHomeDrive(pVal) {
        result := ComCall(11, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pNewVal 
     * @returns {HRESULT} 
     */
    put_TerminalServicesHomeDrive(pNewVal) {
        pNewVal := pNewVal is String ? BSTR.Alloc(pNewVal).Value : pNewVal

        result := ComCall(12, this, "ptr", pNewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_AllowLogon(pVal) {
        result := ComCall(13, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     */
    put_AllowLogon(NewVal) {
        result := ComCall(14, this, "int", NewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_EnableRemoteControl(pVal) {
        result := ComCall(15, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     */
    put_EnableRemoteControl(NewVal) {
        result := ComCall(16, this, "int", NewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_MaxDisconnectionTime(pVal) {
        result := ComCall(17, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     */
    put_MaxDisconnectionTime(NewVal) {
        result := ComCall(18, this, "int", NewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_MaxConnectionTime(pVal) {
        result := ComCall(19, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     */
    put_MaxConnectionTime(NewVal) {
        result := ComCall(20, this, "int", NewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_MaxIdleTime(pVal) {
        result := ComCall(21, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     */
    put_MaxIdleTime(NewVal) {
        result := ComCall(22, this, "int", NewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pNewVal 
     * @returns {HRESULT} 
     */
    get_ReconnectionAction(pNewVal) {
        result := ComCall(23, this, "int*", pNewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     */
    put_ReconnectionAction(NewVal) {
        result := ComCall(24, this, "int", NewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pNewVal 
     * @returns {HRESULT} 
     */
    get_BrokenConnectionAction(pNewVal) {
        result := ComCall(25, this, "int*", pNewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     */
    put_BrokenConnectionAction(NewVal) {
        result := ComCall(26, this, "int", NewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pNewVal 
     * @returns {HRESULT} 
     */
    get_ConnectClientDrivesAtLogon(pNewVal) {
        result := ComCall(27, this, "int*", pNewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     */
    put_ConnectClientDrivesAtLogon(NewVal) {
        result := ComCall(28, this, "int", NewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_ConnectClientPrintersAtLogon(pVal) {
        result := ComCall(29, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     */
    put_ConnectClientPrintersAtLogon(NewVal) {
        result := ComCall(30, this, "int", NewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_DefaultToMainPrinter(pVal) {
        result := ComCall(31, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     */
    put_DefaultToMainPrinter(NewVal) {
        result := ComCall(32, this, "int", NewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_TerminalServicesWorkDirectory(pVal) {
        result := ComCall(33, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pNewVal 
     * @returns {HRESULT} 
     */
    put_TerminalServicesWorkDirectory(pNewVal) {
        pNewVal := pNewVal is String ? BSTR.Alloc(pNewVal).Value : pNewVal

        result := ComCall(34, this, "ptr", pNewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_TerminalServicesInitialProgram(pVal) {
        result := ComCall(35, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pNewVal 
     * @returns {HRESULT} 
     */
    put_TerminalServicesInitialProgram(pNewVal) {
        pNewVal := pNewVal is String ? BSTR.Alloc(pNewVal).Value : pNewVal

        result := ComCall(36, this, "ptr", pNewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
