#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\UIElement.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Input\ManipulationDelta.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IManipulationStartedRoutedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IManipulationStartedRoutedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{5db1aa05-9f80-48b6-ae6c-4f119de8ff13}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Container", "get_Position", "get_Handled", "put_Handled", "get_PointerDeviceType", "get_Cumulative", "Complete"]

    /**
     * @type {UIElement} 
     */
    Container {
        get => this.get_Container()
    }

    /**
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * @type {ManipulationDelta} 
     */
    Cumulative {
        get => this.get_Cumulative()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Container() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        value := POINT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerDeviceType() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ManipulationDelta} 
     */
    get_Cumulative() {
        value := ManipulationDelta()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Completes an authentication token. (CompleteAuthToken)
     * @remarks
     * The client of a transport application calls the <b>CompleteAuthToken</b> function to allow the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> to update a checksum or similar operation after all the protocol headers have been updated by the transport application. The client calls this function only if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (Digest)</a> call returned SEC_I_COMPLETE_NEEDED or SEC_I_COMPLETE_AND_CONTINUE.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 						
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle that was passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The token that was passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_OUT_OF_SEQUENCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client's security context was located, but the message number is incorrect. This return value is used with the Digest SSP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_MESSAGE_ALTERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client's security context was located, but the client's message has been tampered with. This return value is used with the Digest SSP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred that did not map to an SSPI error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/sspi/nf-sspi-completeauthtoken
     */
    Complete() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
