#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents the displays collection for this Text Object Model (TOM) engine instance.
 * @remarks
 * 
  * This interface is currently undefined.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextdisplays
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextDisplays extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextDisplays
     * @type {Guid}
     */
    static IID => Guid("{c241f5f2-7206-11d8-a2c7-00a0d1d6c6b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
