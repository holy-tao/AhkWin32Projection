#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Ole\ICreateErrorInfo.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IImgCreateErrorInfo extends ICreateErrorInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImgCreateErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{1c55a64c-07cd-4fb5-90f7-b753d91f0c9e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AttachToErrorInfo"]

    /**
     * 
     * @param {Pointer<ImgErrorInfo>} pErrorInfo 
     * @returns {HRESULT} 
     */
    AttachToErrorInfo(pErrorInfo) {
        result := ComCall(8, this, "ptr", pErrorInfo, "HRESULT")
        return result
    }
}
