#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISegmentListIterator.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISegmentList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISegmentList
     * @type {Guid}
     */
    static IID => Guid("{3050f605-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateIterator", "GetType", "IsEmpty"]

    /**
     * 
     * @returns {ISegmentListIterator} 
     */
    CreateIterator() {
        result := ComCall(3, this, "ptr*", &ppIIter := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISegmentListIterator(ppIIter)
    }

    /**
     * The GetTypeByName function retrieves a service type GUID for a network service specified by name. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The nspapi.h header defines GetTypeByName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/nspapi/nf-nspapi-gettypebynamew
     */
    GetType() {
        result := ComCall(4, this, "int*", &peType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return peType
    }

    /**
     * IsEmpty (MDX)
     * @remarks
     * The **IsEmpty** function returns **true** if the evaluated expression is an empty cell value. Otherwise, this function returns **false**.  
     *   
     * > [!NOTE]  
     * >  The default property for a member is the value of the member.  
     *   
     *  The **IsEmpty** function is the only way to reliably test for an empty cell because the empty cell value has special meaning in [!INCLUDE[ssASnoversion](../includes/ssasnoversion-md.md)].  
     *   
     * > [!IMPORTANT]  
     * >  If the evaluation of the value expression returns an error, the function will return **false**. A value expression can return an error, for example, if a properties reference refers to an invalid or non-existent property.  
     *   
     *  For more information about empty cells, see the OLE DB documentation.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/sql/ocs/docs/mdx/isempty-mdx
     */
    IsEmpty() {
        result := ComCall(5, this, "int*", &pfEmpty := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfEmpty
    }
}
