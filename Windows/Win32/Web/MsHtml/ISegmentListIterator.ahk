#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISegment.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISegmentListIterator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISegmentListIterator
     * @type {Guid}
     */
    static IID => Guid("{3050f692-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Current", "First", "IsDone", "Advance"]

    /**
     * Current (MDX)
     * @remarks
     * At each step during an iteration, the tuple being operated upon is the current tuple. The **Current** function returns that tuple. This function is only valid during an iteration over a set.  
     *   
     *  MDX functions that iterate through a set include the [Generate](../mdx/generate-mdx.md) function.  
     *   
     * > [!NOTE]  
     * >  This function only works with sets that are named, either using a set alias or by defining a named set.
     * @returns {ISegment} 
     * @see https://learn.microsoft.com/sql/ocs/docs/mdx/current-mdx
     */
    Current() {
        result := ComCall(3, this, "ptr*", &ppISegment := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISegment(ppISegment)
    }

    /**
     * FirstChild (MDX)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/mdx/firstchild-mdx
     */
    First() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDone() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns a boolean value that describes if the specified Advanced Color kind value is inherently supported by the monitor or display driver.
     * @remarks
     * This method returns the static capability of the system and has nothing to do with the current state.
     * @returns {HRESULT} **True** if the specified Advanced Color kind is supported; otherwise, **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.advancedcolorinfo.isadvancedcolorkindavailable
     */
    Advance() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
