#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method that allows content protection systems to perform a handshake with the protected environment. This is needed because the CreateFile and DeviceIoControl APIs are not available to Windows Store apps.
 * @remarks
 * 
 * See  <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreateprotectedenvironmentaccess">MFCreateProtectedEnvironmentAccess</a> for an example of how to create and use an <b>IMFProtectedEnvironmentAccess</b> object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfprotectedenvironmentaccess
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFProtectedEnvironmentAccess extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFProtectedEnvironmentAccess
     * @type {Guid}
     */
    static IID => Guid("{ef5dc845-f0d9-4ec9-b00c-cb5183d38434}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Call", "ReadGRL"]

    /**
     * Allows content protection systems to access the protected environment.
     * @param {Integer} inputLength The length in bytes of the input data.
     * @param {Pointer} input A pointer to the input data.
     * @param {Integer} outputLength The length in bytes of the output data.
     * @param {Pointer} output A pointer to the output data.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfprotectedenvironmentaccess-call
     */
    Call(inputLength, input, outputLength, output) {
        result := ComCall(3, this, "uint", inputLength, "ptr", input, "uint", outputLength, "ptr", output, "HRESULT")
        return result
    }

    /**
     * Gets the Global Revocation List (GLR).
     * @param {Pointer<Integer>} outputLength The length of the data returned in <b>output</b>.
     * @param {Pointer<Pointer<Integer>>} output Receives the contents of the global revocation list file.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfprotectedenvironmentaccess-readgrl
     */
    ReadGRL(outputLength, output) {
        outputLengthMarshal := outputLength is VarRef ? "uint*" : "ptr"
        outputMarshal := output is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, outputLengthMarshal, outputLength, outputMarshal, output, "HRESULT")
        return result
    }
}
