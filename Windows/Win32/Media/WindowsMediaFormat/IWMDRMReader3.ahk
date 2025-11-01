#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDRMReader2.ahk

/**
 * The IWMDRMReader3 interface enables content transcription by providing a method to get protection systems approved by a license.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmdrmreader3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMReader3 extends IWMDRMReader2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDRMReader3
     * @type {Guid}
     */
    static IID => Guid("{e08672de-f1e7-4ff4-a0a3-fc4b08e4caf8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInclusionList"]

    /**
     * 
     * @param {Pointer<Pointer<Guid>>} ppGuids 
     * @param {Pointer<Integer>} pcGuids 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader3-getinclusionlist
     */
    GetInclusionList(ppGuids, pcGuids) {
        pcGuidsMarshal := pcGuids is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ptr*", ppGuids, pcGuidsMarshal, pcGuids, "HRESULT")
        return result
    }
}
