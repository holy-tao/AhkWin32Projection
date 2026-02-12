#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaBreak.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaBreakFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaBreakFactory
     * @type {Guid}
     */
    static IID => Guid("{4516e002-18e0-4079-8b5f-d33495c15d2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithPresentationPosition"]

    /**
     * Create Extended Stored Procedures
     * @param {Integer} insertionMethod 
     * @returns {MediaBreak} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(insertionMethod) {
        result := ComCall(6, this, "int", insertionMethod, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaBreak(result_)
    }

    /**
     * 
     * @param {Integer} insertionMethod 
     * @param {TimeSpan} presentationPosition 
     * @returns {MediaBreak} 
     */
    CreateWithPresentationPosition(insertionMethod, presentationPosition) {
        result := ComCall(7, this, "int", insertionMethod, "ptr", presentationPosition, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaBreak(result_)
    }
}
