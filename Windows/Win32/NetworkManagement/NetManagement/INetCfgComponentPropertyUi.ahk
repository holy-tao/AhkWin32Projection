#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponentPropertyUi extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgComponentPropertyUi
     * @type {Guid}
     */
    static IID => Guid("{932238e0-bea1-11d0-9298-00c04fc99dcf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryPropertyUi", "SetContext", "MergePropPages", "ValidateProperties", "ApplyProperties", "CancelProperties"]

    /**
     * 
     * @param {IUnknown} pUnkReserved 
     * @returns {HRESULT} 
     */
    QueryPropertyUi(pUnkReserved) {
        result := ComCall(3, this, "ptr", pUnkReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables a transport application to set attributes of a security context for a security package. This function is supported only by the Schannel security package. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The sspi.h header defines SetContextAttributes as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {IUnknown} pUnkReserved 
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns a nonzero error code. The following error code is one of the possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is returned by Schannel kernel mode to indicate that this function is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/sspi/nf-sspi-setcontextattributesw
     */
    SetContext(pUnkReserved) {
        result := ComCall(4, this, "ptr", pUnkReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwDefPages 
     * @param {Pointer<Pointer<Integer>>} pahpspPrivate 
     * @param {Pointer<Integer>} pcPages 
     * @param {HWND} hwndParent 
     * @param {Pointer<PWSTR>} pszStartPage 
     * @returns {HRESULT} 
     */
    MergePropPages(pdwDefPages, pahpspPrivate, pcPages, hwndParent, pszStartPage) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        pdwDefPagesMarshal := pdwDefPages is VarRef ? "uint*" : "ptr"
        pahpspPrivateMarshal := pahpspPrivate is VarRef ? "ptr*" : "ptr"
        pcPagesMarshal := pcPages is VarRef ? "uint*" : "ptr"
        pszStartPageMarshal := pszStartPage is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pdwDefPagesMarshal, pdwDefPages, pahpspPrivateMarshal, pahpspPrivate, pcPagesMarshal, pcPages, "ptr", hwndParent, pszStartPageMarshal, pszStartPage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HWND} hwndSheet 
     * @returns {HRESULT} 
     */
    ValidateProperties(hwndSheet) {
        hwndSheet := hwndSheet is Win32Handle ? NumGet(hwndSheet, "ptr") : hwndSheet

        result := ComCall(6, this, "ptr", hwndSheet, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ApplyProperties() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelProperties() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
