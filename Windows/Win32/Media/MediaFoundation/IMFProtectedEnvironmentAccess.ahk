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
     * 
     * @param {Integer} inputLength 
     * @param {Pointer} input 
     * @param {Integer} outputLength 
     * @param {Pointer} output 
     * @returns {HRESULT} 
     */
    Call(inputLength, input, outputLength, output) {
        result := ComCall(3, this, "uint", inputLength, "ptr", input, "uint", outputLength, "ptr", output, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} outputLength 
     * @param {Pointer<Byte>} output 
     * @returns {HRESULT} 
     */
    ReadGRL(outputLength, output) {
        result := ComCall(4, this, "uint*", outputLength, "char*", output, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
