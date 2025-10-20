#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An IInkDesktopHost object enables ink input, processing, and rendering through the creation of an app thread to host an IInkPresenterDesktop object and insert it into the app's DirectComposition visual tree.
 * @see https://docs.microsoft.com/windows/win32/api//inkpresenterdesktop/nn-inkpresenterdesktop-iinkdesktophost
 * @namespace Windows.Win32.UI.Input.Ink
 * @version v4.0.30319
 */
class IInkDesktopHost extends IUnknown{
    /**
     * The interface identifier for IInkDesktopHost
     * @type {Guid}
     */
    static IID => Guid("{4ce7d875-a981-4140-a1ff-ad93258e8d59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IInkHostWorkItem>} workItem 
     * @returns {HRESULT} 
     */
    QueueWorkItem(workItem) {
        result := ComCall(3, this, "ptr", workItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateInkPresenter(riid, ppv) {
        result := ComCall(4, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} rootVisual 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateAndInitializeInkPresenter(rootVisual, width, height, riid, ppv) {
        result := ComCall(5, this, "ptr", rootVisual, "float", width, "float", height, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
