#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * > [!NOTE]
  * > The [DisplayProperties](displayproperties.md) type and related event handlers may be altered or unavailable for releases after Windows 8.1. Instead, use [DisplayInformation](displayinformation.md).
  * 
  * Represents a method that handles display property events.
 * @remarks
 * We recommend that applications use a single delegate to handle most display events because in most cases the change to each display property requires that the application redraw itself. Also, many property changes result from a single mode change that affects the entire operating system.
 * 
 * The [Direct3D 11.1 Simple Stereo 3D Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Direct3D%20stereoscopic%203D%20sample) shows how to handle system stereo changes.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displaypropertieseventhandler
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class DisplayPropertiesEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DisplayPropertiesEventHandler
     * @type {Guid}
     */
    static IID => Guid("{dbdd8b01-f1a1-46d1-9ee3-543bcc995980}")

    /**
     * The class identifier for DisplayPropertiesEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{dbdd8b01-f1a1-46d1-9ee3-543bcc995980}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {IInspectable} sender 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender) {
        result := ComCall(3, this, "ptr", sender, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
