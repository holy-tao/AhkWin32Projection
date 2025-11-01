#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * Gets information about one stream in a media source.
 * @remarks
 * 
  * A presentation descriptor contains one or more stream descriptors. To get the stream descriptors from a presentation descriptor, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationdescriptor-getstreamdescriptorbyindex">IMFPresentationDescriptor::GetStreamDescriptorByIndex</a>. To create a new stream descriptor, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatestreamdescriptor">MFCreateStreamDescriptor</a>.
  * 
  * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
  * 
  * <ul>
  * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
  * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfstreamdescriptor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFStreamDescriptor extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFStreamDescriptor
     * @type {Guid}
     */
    static IID => Guid("{56c03d9c-9dbb-45f5-ab4b-d80f47c05938}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamIdentifier", "GetMediaTypeHandler"]

    /**
     * 
     * @param {Pointer<Integer>} pdwStreamIdentifier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamdescriptor-getstreamidentifier
     */
    GetStreamIdentifier(pdwStreamIdentifier) {
        pdwStreamIdentifierMarshal := pdwStreamIdentifier is VarRef ? "uint*" : "ptr"

        result := ComCall(33, this, pdwStreamIdentifierMarshal, pdwStreamIdentifier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaTypeHandler>} ppMediaTypeHandler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamdescriptor-getmediatypehandler
     */
    GetMediaTypeHandler(ppMediaTypeHandler) {
        result := ComCall(34, this, "ptr*", ppMediaTypeHandler, "HRESULT")
        return result
    }
}
