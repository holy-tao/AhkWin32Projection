#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Retrieves the configuration string for a Certificate Services server. This method was first defined in the ICertConfig interface.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) name portion of the configuration string that this function returns is the exact text entered during the Certificate Services setup process. Note that this text may be different from the form of the CA name found in file names (such as for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a>) or in registry keys. This is because file names and registry keys use a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">sanitized</a> version of the CA name.
 * 
 * The process of sanitizing the CA name is necessary to remove characters that are illegal for file names, registry key names, or distinguished name values, or illegal for reasons specific to Certificate Services. In the sanitizing process, any illegal character in the common name is converted to a five-character representation in the format <b>!</b><i>xxxx</i>, where <b>!</b> is used as an escape character and <i>xxxx</i> represents four hexadecimal digits that uniquely identify the character to be converted.
 * 
 * For example, the number sign (#) is not allowed in distinguished names in Active Directory. If the CA name entered during setup is <b>#</b><i>YourName</i>, the sanitized CA name will be <b>!0023</b><i>YourName</i>.
 * 
 * The following characters, if entered for the common name of the CA during setup, are converted to the <b>!</b><i>xxxx</i> format during the sanitizing process. This list is subject to change.
 * 
 * <table>
 * <tr>
 * <th>Name</th>
 * <th>Character</th>
 * <th>Value in !xxxx format</th>
 * </tr>
 * <tr>
 * <td>Ampersand</td>
 * <td>&amp;</td>
 * <td>!0026</td>
 * </tr>
 * <tr>
 * <td>Apostrophe</td>
 * <td>'</td>
 * <td>!0027</td>
 * </tr>
 * <tr>
 * <td>Asterisk</td>
 * <td>*</td>
 * <td>!002a</td>
 * </tr>
 * <tr>
 * <td>Backslash</td>
 * <td>\</td>
 * <td>!005c</td>
 * </tr>
 * <tr>
 * <td>Left brace</td>
 * <td>{</td>
 * <td>!007b</td>
 * </tr>
 * <tr>
 * <td>Right brace</td>
 * <td>}</td>
 * <td>!007d</td>
 * </tr>
 * <tr>
 * <td>Left bracket</td>
 * <td>[</td>
 * <td>!005b</td>
 * </tr>
 * <tr>
 * <td>Right bracket</td>
 * <td>]</td>
 * <td>!005d</td>
 * </tr>
 * <tr>
 * <td>Caret</td>
 * <td>^</td>
 * <td>!005e</td>
 * </tr>
 * <tr>
 * <td>Colon</td>
 * <td>:</td>
 * <td>!003a</td>
 * </tr>
 * <tr>
 * <td>Comma</td>
 * <td>,</td>
 * <td>!002c</td>
 * </tr>
 * <tr>
 * <td>Equal sign</td>
 * <td>=</td>
 * <td>!003d</td>
 * </tr>
 * <tr>
 * <td>Exclamation point</td>
 * <td>!</td>
 * <td>!0021</td>
 * </tr>
 * <tr>
 * <td>Grave accent</td>
 * <td>`</td>
 * <td>!0060</td>
 * </tr>
 * <tr>
 * <td>Greater than sign</td>
 * <td>&gt;</td>
 * <td>!003e</td>
 * </tr>
 * <tr>
 * <td>Less than sign</td>
 * <td>&lt;</td>
 * <td>!003c</td>
 * </tr>
 * <tr>
 * <td>Number sign</td>
 * <td>#</td>
 * <td>!0023</td>
 * </tr>
 * <tr>
 * <td>Opening parenthesis</td>
 * <td>(</td>
 * <td>!0028</td>
 * </tr>
 * <tr>
 * <td>Closing parenthesis</td>
 * <td>)</td>
 * <td>!0029</td>
 * </tr>
 * <tr>
 * <td>Percent</td>
 * <td>%</td>
 * <td>!0025</td>
 * </tr>
 * <tr>
 * <td>Pipe</td>
 * <td>|</td>
 * <td>!007c</td>
 * </tr>
 * <tr>
 * <td>Plus sign</td>
 * <td>+</td>
 * <td>!002b</td>
 * </tr>
 * <tr>
 * <td>Question mark</td>
 * <td>?</td>
 * <td>!003f</td>
 * </tr>
 * <tr>
 * <td>Quotation mark</td>
 * <td>"</td>
 * <td>!0022</td>
 * </tr>
 * <tr>
 * <td>Semicolon</td>
 * <td>;</td>
 * <td>!003b</td>
 * </tr>
 * <tr>
 * <td>Slash mark</td>
 * <td>/</td>
 * <td>!002f</td>
 * </tr>
 * </table>
 *  
 * 
 * Any nonprinting character and all <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> characters that are not seven bits are also converted to the <b>!</b><i>xxxx</i> format.
 * 
 * A sanitized short name is generated when the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">sanitized name</a> is too long for a 64-character directory services <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">relative distinguished name</a> (RDN). The sanitized short name consists of the sanitized name truncated and appended with a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> of the full sanitized name. The sanitized short name reserves some of the 64 characters to contain <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a> (CRL) suffixes, such as (123).
 * 
 * The certification authority name portion of the configuration string returned by this method is the original text entered during setup. Note that Certificate Services methods that require a certification authority name as a parameter accept the originally entered certification authority name. For example, for the certification authority name <b>#</b><i>YourName</i>, the  
 * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-openconnection">ICertView2::OpenConnection</a> method accepts <b>#</b><i>YourName</i> as the parameter's certification authority portion.
 * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertconfig-getconfig
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CCertConfig extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
