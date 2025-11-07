#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcPart.ahk
#Include .\IOpcPartEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * A read-only enumerator of IOpcPart interface pointers.
 * @remarks
 * 
  * To get a pointer to this interface, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcpartset-getenumerator">IOpcPartSet::GetEnumerator</a> method.
  * 
  * When an enumerator is created, the current position precedes the first pointer. To set the current position to the first pointer of the enumerator, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcpartenumerator-movenext">MoveNext</a>method after creating the enumerator.
  * 
  * <div class="alert"><b>Note</b>  Changes to the enumerator's underlying set will invalidate the enumerator, and all subsequent calls will fail.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcpartenumerator
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcPartEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcPartEnumerator
     * @type {Guid}
     */
    static IID => Guid("{42195949-3b79-4fc8-89c6-fc7fb979ee75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MoveNext", "MovePrevious", "GetCurrent", "Clone"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpartenumerator-movenext
     */
    MoveNext() {
        result := ComCall(3, this, "int*", &hasNext := 0, "HRESULT")
        return hasNext
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpartenumerator-moveprevious
     */
    MovePrevious() {
        result := ComCall(4, this, "int*", &hasPrevious := 0, "HRESULT")
        return hasPrevious
    }

    /**
     * 
     * @returns {IOpcPart} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpartenumerator-getcurrent
     */
    GetCurrent() {
        result := ComCall(5, this, "ptr*", &part := 0, "HRESULT")
        return IOpcPart(part)
    }

    /**
     * 
     * @returns {IOpcPartEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpartenumerator-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &copy := 0, "HRESULT")
        return IOpcPartEnumerator(copy)
    }
}
