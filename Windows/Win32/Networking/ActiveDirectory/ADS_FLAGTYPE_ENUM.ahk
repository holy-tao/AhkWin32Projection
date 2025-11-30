#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ADS_FLAGTYPE_ENUM enumeration specifies values that can be used to indicate the presence of the ObjectType or InheritedObjectType fields in the access-control entry (ACE).
 * @remarks
 * 
 * <b>ObjectType</b> indicates what object type, property set, or property an ACE refers to. It takes a GUID as its value. The GUID referenced by <b>ObjectType</b> is not physically present in the ACE unless ADS_FLAGS_OBJECT_TYPE_PRESENT is set.
 * 
 * <b>InheritedObjectType</b> specifies the GUID of an object that will inherit the ACE. The GUID is not physically present in the ACE unless the ADS_FLAG_INHERITED_OBJECT_TYPE_PRESENT bit is set.
 * 
 * <div class="alert"><b>Note</b>  Because VBScript cannot read information from a type library, VBScript applications do not understand the symbolic constants as defined above. You should use the numerical constants instead to set the appropriate flags in your VBScript applications. If you want to use the symbolic constants as a good programming practice, you should make explicit declarations of such constants, as done here, in your VBScript applications.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_flagtype_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_FLAGTYPE_ENUM extends Win32Enum{

    /**
     * The <b>ObjectType</b> field is present in the ACE.
     * @type {Integer (Int32)}
     */
    static ADS_FLAG_OBJECT_TYPE_PRESENT => 1

    /**
     * The <b>InheritedObjectType</b> field is present in the ACE.
     * @type {Integer (Int32)}
     */
    static ADS_FLAG_INHERITED_OBJECT_TYPE_PRESENT => 2
}
