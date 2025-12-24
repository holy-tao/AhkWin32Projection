#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReaderAccelerator interface is implemented on the reader object only when it is in decoding mode. It is called by a player or a player source filter to obtain interfaces from the decoder DMO.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderaccelerator
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderAccelerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderAccelerator
     * @type {Guid}
     */
    static IID => Guid("{bddc4d08-944d-4d52-a612-46c3fda07dd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCodecInterface", "Notify"]

    /**
     * The GetCodecInterface method is used to retrieve a pointer to the IWMCodecAMVideoAccelerator interface exposed on the decoder DMO.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {Pointer<Guid>} riid Reference to the IID of the interface to obtain. The value must be IID_IWMCodecAMVideoAccelerator.
     * @returns {Pointer<Void>} Address of a pointer that receives the interface specified by <i>riid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderaccelerator-getcodecinterface
     */
    GetCodecInterface(dwOutputNum, riid) {
        result := ComCall(3, this, "uint", dwOutputNum, "ptr", riid, "ptr*", &ppvCodecInterface := 0, "HRESULT")
        return ppvCodecInterface
    }

    /**
     * The Notify method is called by the source filter to pass in the negotiated media type.
     * @param {Integer} dwOutputNum <b>DWORD</b> that specifies the stream associated with the notification.
     * @param {Pointer<WM_MEDIA_TYPE>} pSubtype Pointer to a media type that describes the current connection parameters for the stream.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code .
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderaccelerator-notify
     */
    Notify(dwOutputNum, pSubtype) {
        result := ComCall(4, this, "uint", dwOutputNum, "ptr", pSubtype, "HRESULT")
        return result
    }
}
