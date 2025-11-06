#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPartPrintTicket.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IPrintWriteStream.ahk
#Include .\IXpsPartIterator.ahk
#Include .\IPartBase.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IFixedPage extends IPartBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFixedPage
     * @type {Guid}
     */
    static IID => Guid("{3d9f6448-7e95-4cb5-94fb-0180c2883a57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPrintTicket", "GetPagePart", "GetWriteStream", "SetPrintTicket", "SetPagePart", "DeleteResource", "GetXpsPartIterator"]

    /**
     * 
     * @returns {IPartPrintTicket} 
     */
    GetPrintTicket() {
        result := ComCall(7, this, "ptr*", &ppPrintTicket := 0, "HRESULT")
        return IPartPrintTicket(ppPrintTicket)
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @returns {IUnknown} 
     */
    GetPagePart(uri) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(8, this, "ptr", uri, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @returns {IPrintWriteStream} 
     */
    GetWriteStream() {
        result := ComCall(9, this, "ptr*", &ppWriteStream := 0, "HRESULT")
        return IPrintWriteStream(ppWriteStream)
    }

    /**
     * 
     * @param {IPartPrintTicket} ppPrintTicket 
     * @returns {HRESULT} 
     */
    SetPrintTicket(ppPrintTicket) {
        result := ComCall(10, this, "ptr", ppPrintTicket, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     */
    SetPagePart(pUnk) {
        result := ComCall(11, this, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @returns {HRESULT} 
     */
    DeleteResource(uri) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(12, this, "ptr", uri, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsPartIterator} 
     */
    GetXpsPartIterator() {
        result := ComCall(13, this, "ptr*", &pXpsPartIt := 0, "HRESULT")
        return IXpsPartIterator(pXpsPartIt)
    }
}
