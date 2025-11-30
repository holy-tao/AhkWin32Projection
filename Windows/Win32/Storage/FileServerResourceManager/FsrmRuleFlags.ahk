#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible states of a rule.
 * @remarks
 * 
 * You cannot set <b>FsrmRuleFlags_Invalid</b>; this flag is used by FSRM.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmruleflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmRuleFlags extends Win32Enum{

    /**
     * Disable the rule; do not use the rule to classify files.
     * @type {Integer (Int32)}
     */
    static FsrmRuleFlags_Disabled => 256

    /**
     * Clear any automatically classified property referenced by this rule if the rule conditions are no longer met. 
     *        This can be useful if the file contents or metadata changed and the property previously assigned by automatic 
     *        classification no longer apply.
     * 
     * <b>Windows Server 2012 and Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static FsrmRuleFlags_ClearAutomaticallyClassifiedProperty => 1024

    /**
     * Clear any manually classified property referenced by this rule if the rule conditions are no longer met. This 
     *        can be useful if the file contents or metadata changed and the property previously assigned by manual 
     *        classification no longer apply.
     * 
     * <b>Windows Server 2012 and Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static FsrmRuleFlags_ClearManuallyClassifiedProperty => 2048

    /**
     * Do not set this flag. FSRM sets this flag if the classifier that uses the rule is either disabled or not 
     *       registered with FSRM. If this flag is set FSRM will not use the rule to classify files.
     * @type {Integer (Int32)}
     */
    static FsrmRuleFlags_Invalid => 4096
}
