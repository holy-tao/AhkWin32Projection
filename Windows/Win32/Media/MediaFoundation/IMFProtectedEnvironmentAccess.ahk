#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method that allows content protection systems to perform a handshake with the protected environment. This is needed because the CreateFile and DeviceIoControl APIs are not available to Windows Store apps.
 * @remarks
 * See  <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreateprotectedenvironmentaccess">MFCreateProtectedEnvironmentAccess</a> for an example of how to create and use an <b>IMFProtectedEnvironmentAccess</b> object.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfprotectedenvironmentaccess
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFProtectedEnvironmentAccess extends IUnknown {
    /**
     * The interface identifier for IMFProtectedEnvironmentAccess
     * @type {Guid}
     */
    static IID := Guid("{ef5dc845-f0d9-4ec9-b00c-cb5183d38434}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFProtectedEnvironmentAccess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Call    : IntPtr
        ReadGRL : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFProtectedEnvironmentAccess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Allows content protection systems to access the protected environment.
     * @remarks
     * See  <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreateprotectedenvironmentaccess">MFCreateProtectedEnvironmentAccess</a> for an example of how to create an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfprotectedenvironmentaccess">IMFProtectedEnvironmentAccess</a> object and use the <b>Call</b> method.
     * @param {Integer} inputLength The length in bytes of the input data.
     * @param {Integer} _input A pointer to the input data.
     * @param {Integer} outputLength The length in bytes of the output data.
     * @param {Integer} output A pointer to the output data.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfprotectedenvironmentaccess-call
     */
    Call(inputLength, _input, outputLength, output) {
        result := ComCall(3, this, "uint", inputLength, "ptr", _input, "uint", outputLength, "ptr", output, "HRESULT")
        return result
    }

    /**
     * Gets the Global Revocation List (GLR).
     * @remarks
     * Allows reading of the system Global Revocation List (GRL).
     * @param {Pointer<Integer>} outputLength The length of the data returned in <b>output</b>.
     * @param {Pointer<Pointer<Integer>>} output Receives the contents of the global revocation list file.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfprotectedenvironmentaccess-readgrl
     */
    ReadGRL(outputLength, output) {
        outputLengthMarshal := outputLength is VarRef ? "uint*" : "ptr"
        outputMarshal := output is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, outputLengthMarshal, outputLength, outputMarshal, output, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFProtectedEnvironmentAccess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Call := CallbackCreate(GetMethod(implObj, "Call"), flags, 5)
        this.vtbl.ReadGRL := CallbackCreate(GetMethod(implObj, "ReadGRL"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Call)
        CallbackFree(this.vtbl.ReadGRL)
    }
}
