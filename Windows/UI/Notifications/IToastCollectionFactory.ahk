#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ToastCollection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastCollectionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastCollectionFactory
     * @type {Guid}
     */
    static IID => Guid("{164dd3d7-73c4-44f7-b4ff-fb6d4bf1f4c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {HSTRING} collectionId 
     * @param {HSTRING} displayName 
     * @param {HSTRING} launchArgs 
     * @param {Uri} iconUri 
     * @returns {ToastCollection} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(collectionId, displayName, launchArgs, iconUri) {
        if(collectionId is String) {
            pin := HSTRING.Create(collectionId)
            collectionId := pin.Value
        }
        collectionId := collectionId is Win32Handle ? NumGet(collectionId, "ptr") : collectionId
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName
        if(launchArgs is String) {
            pin := HSTRING.Create(launchArgs)
            launchArgs := pin.Value
        }
        launchArgs := launchArgs is Win32Handle ? NumGet(launchArgs, "ptr") : launchArgs

        result := ComCall(6, this, "ptr", collectionId, "ptr", displayName, "ptr", launchArgs, "ptr", iconUri, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ToastCollection(value)
    }
}
