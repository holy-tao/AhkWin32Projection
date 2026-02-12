#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PageStackEntry.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class IPageStackEntryFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPageStackEntryFactory
     * @type {Guid}
     */
    static IID => Guid("{4454048a-a8b9-4f78-9b84-1f51f58851ff}")

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
     * @param {TypeName} sourcePageType 
     * @param {IInspectable} parameter 
     * @param {NavigationTransitionInfo} navigationTransitionInfo_ 
     * @returns {PageStackEntry} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(sourcePageType, parameter, navigationTransitionInfo_) {
        result := ComCall(6, this, "ptr", sourcePageType, "ptr", parameter, "ptr", navigationTransitionInfo_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PageStackEntry(value)
    }
}
