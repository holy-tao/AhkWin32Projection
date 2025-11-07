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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProcedureAddress"]

    /**
     * 
     * @param {PSTR} name 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsignedlibrary-getprocedureaddress
     */
    GetProcedureAddress(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", name, "ptr*", &address := 0, "HRESULT")
        return address
    }
}
