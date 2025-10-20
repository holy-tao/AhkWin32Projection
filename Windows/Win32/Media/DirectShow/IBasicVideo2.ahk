#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBasicVideo.ahk

/**
 * The IBasicVideo2 interface extends the IBasicVideo interface.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-ibasicvideo2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBasicVideo2 extends IBasicVideo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBasicVideo2
     * @type {Guid}
     */
    static IID => Guid("{329bb360-f6ea-11d1-9038-00a0c9697298}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 39

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPreferredAspectRatio"]

    /**
     * 
     * @param {Pointer<Integer>} plAspectX 
     * @param {Pointer<Integer>} plAspectY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo2-getpreferredaspectratio
     */
    GetPreferredAspectRatio(plAspectX, plAspectY) {
        result := ComCall(39, this, "int*", plAspectX, "int*", plAspectY, "HRESULT")
        return result
    }
}
