#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\ISequentialStream.ahk

/**
 * A write-only stream interface into which an application writes print job data.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nf-xpsprint-ixpsprintjobstream-close">Close</a> method must be called before this interface is released.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsprint/nn-xpsprint-ixpsprintjobstream
 * @namespace Windows.Win32.Storage.Xps.Printing
 * @version v4.0.30319
 */
class IXpsPrintJobStream extends ISequentialStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsPrintJobStream
     * @type {Guid}
     */
    static IID => Guid("{7a77dc5f-45d6-4dff-9307-d8cb846347ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Close"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsprint/nf-xpsprint-ixpsprintjobstream-close
     */
    Close() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
