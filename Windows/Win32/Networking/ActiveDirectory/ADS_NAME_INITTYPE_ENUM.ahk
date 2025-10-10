#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ADS_NAME_INITTYPE_ENUM enumeration specifies the types of initialization to perform on a NameTranslate object. It is used in the IADsNameTranslate interface.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-init">IADsNameTranslate::Init</a> method or <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-initex">IADsNameTranslate::InitEx</a> method uses these options to initialize the <b>NameTranslate</b> object. When <b>ADS_NAME_INITTYPE_SERVER</b> is used, specify the machine name of a directory server. When <b>ADS_NAME_INITTYPE_DOMAIN</b> is set, supply the domain name within a directory forest. When <b>ADS_NAME_INITTYPE_GC</b> is issued, the second parameter in <b>IADsNameTranslate::Init</b> or <b>IADsNameTranslate::InitEx</b> is ignored. The Global Catalog server of the domain of the current computer is used to perform the name translate operations. The initialization fails if the host computer is not part of a domain because no global catalog will be found.
  * 
  * <div class="alert"><b>Note</b>  Because VBScript cannot read data from a type library, VBScript applications do not recognize the symbolic constants as defined above. Instead, use the numeric constants to set the appropriate flags in your VBScript applications. To use symbolic constants as a good programming practice, write explicit declarations of such constants, as done here, in your VBScript applications.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_name_inittype_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_NAME_INITTYPE_ENUM{

    /**
     * Initializes a <b>NameTranslate</b> object by setting the domain that the object binds to.
     * @type {Integer (Int32)}
     */
    static ADS_NAME_INITTYPE_DOMAIN => 1

    /**
     * Initializes a <b>NameTranslate</b> object by setting the server that the object binds to.
     * @type {Integer (Int32)}
     */
    static ADS_NAME_INITTYPE_SERVER => 2

    /**
     * Initializes a <b>NameTranslate</b> object by locating the global catalog that the object binds to.
     * @type {Integer (Int32)}
     */
    static ADS_NAME_INITTYPE_GC => 3
}
