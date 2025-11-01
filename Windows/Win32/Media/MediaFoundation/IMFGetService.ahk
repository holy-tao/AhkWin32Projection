#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Queries an object for a specified service interface.
 * @remarks
 * 
  * A service is an interface that is exposed by one object but might be implemented by another object. The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">GetService</a> method is equivalent to <b>QueryInterface</b>, with the following difference: when <b>QueryInterface</b> retrieves a pointer to an interface, it is guaranteed that you can query the returned interface and get back the original interface. The <b>GetService</b> method does not make this guarantee, because the retrieved interface might be implemented by a separate object.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfgetservice">MFGetService</a> function is a helper function that queries an object for <b>IMFGetService</b> and calls the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">GetService</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfgetservice
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFGetService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFGetService
     * @type {Guid}
     */
    static IID => Guid("{fa993888-4383-415a-a930-dd472a8cf6f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetService"]

    /**
     * 
     * @param {Pointer<Guid>} guidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfgetservice-getservice
     */
    GetService(guidService, riid, ppvObject) {
        result := ComCall(3, this, "ptr", guidService, "ptr", riid, "ptr*", ppvObject, "HRESULT")
        return result
    }
}
