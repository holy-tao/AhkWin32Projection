#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method that allows content protection systems to get the procedure address of a function in the signed library. This method provides the same functionality as GetProcAddress which is not available to Windows Store apps.
 * @remarks
 * 
  * See  <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfloadsignedlibrary">MFLoadSignedLibrary</a> for an example of how to create and use an <b>IMFSignedLibrary</b> object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsignedlibrary
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSignedLibrary extends IUnknown{
    /**
     * The interface identifier for IMFSignedLibrary
     * @type {Guid}
     */
    static IID => Guid("{4a724bca-ff6a-4c07-8e0d-7a358421cf06}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PSTR} name 
     * @param {Pointer<Void>} address 
     * @returns {HRESULT} 
     */
    GetProcedureAddress(name, address) {
        result := ComCall(3, this, "ptr", name, "ptr", address, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
