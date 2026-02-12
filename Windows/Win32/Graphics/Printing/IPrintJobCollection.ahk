#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintJob.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintJobCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintJobCollection
     * @type {Guid}
     */
    static IID => Guid("{72b82a24-a598-4e87-895f-cdb23a49e9dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "GetAt", "get__NewEnum"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "uint*", &pulCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulCount
    }

    /**
     * Retrieves a copy of the character string associated with the specified local atom. (Unicode)
     * @remarks
     * The string returned for an integer atom (an atom whose value is in the range 0x0001 to 0xBFFF) is a null-terminated string in which the first character is a pound sign (#) and the remaining characters represent the unsigned integer atom value. 
     * 
     * <h3><a id="Security_Considerations"></a><a id="security_considerations"></a><a id="SECURITY_CONSIDERATIONS"></a>Security Considerations</h3>
     * Using this function incorrectly might compromise the security of your program. Incorrect use of this function includes not correctly specifying the size of the <i>lpBuffer</i> parameter. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetAtomName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} ulIndex 
     * @returns {IPrintJob} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-getatomnamew
     */
    GetAt(ulIndex) {
        result := ComCall(8, this, "uint", ulIndex, "ptr*", &ppJob := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPrintJob(ppJob)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppUnk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppUnk)
    }
}
