#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates a proxy to a byte stream.
 * @remarks
 * 
  * This interface provides a factory object for creating a proxy to an existing Microsoft Media Foundation byte stream. The CLSID of the factory object is <b>CLSID_MFByteStreamProxyClassFactory</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfbytestreamproxyclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFByteStreamProxyClassFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFByteStreamProxyClassFactory
     * @type {Guid}
     */
    static IID => Guid("{a6b43f84-5c0a-42e8-a44d-b1857a76992f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateByteStreamProxy"]

    /**
     * 
     * @param {IMFByteStream} pByteStream 
     * @param {IMFAttributes} pAttributes 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestreamproxyclassfactory-createbytestreamproxy
     */
    CreateByteStreamProxy(pByteStream, pAttributes, riid, ppvObject) {
        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pByteStream, "ptr", pAttributes, "ptr", riid, ppvObjectMarshal, ppvObject, "HRESULT")
        return result
    }
}
